import 'dart:io';
import 'package:dio/dio.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/payroll_dto.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/response/office_assets_dto.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/response/upload_image_response_dto.dart';
import 'package:workmate/features/profile/data/datasource/remote/profile_remote_data_source.dart';
import '../../../../../core/data/exception/app_exception.dart';
import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';
import 'dto/employee_profile_dto.dart';
import 'dto/request/complete_profile_request.dart';
import 'dto/request/update_profile_request_dto.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient _dioClient;

  const ProfileRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<EmployeeProfileDto> getProfile() async {
    final response = await _dioClient.get(ApiConstants.getProfile);

    final success = response.data['success'] as bool?;
    if (success == false) {
      final errorCode = response.data['error_code'] as String?;
      if (errorCode == 'PROFILE_NOT_COMPLETED') {
        throw ServerException(
          message: response.data['message'] as String? ?? 'Profile not completed yet.',
          code: 'PROFILE_NOT_COMPLETED',
          statusCode: 200,
        );
      }
    }

    final data = response.data['data'] as Map<String, dynamic>;
    return EmployeeProfileDto.fromJson(data);
  }

  @override
  Future<EmployeeProfileDto> completeProfile({
    required CompleteProfileRequestDto request,
    String? profileImagePath,
  }) async {
    Response response;

    if (profileImagePath == null || profileImagePath.isEmpty) {
      response = await _dioClient.post(
        ApiConstants.completeProfile,
        data: request.toJson(),
      );
    } else {
      final file = File(profileImagePath);
      if (!file.existsSync()) {
        throw const ValidationException(message: 'Profile image file does not exist');
      }

      final fileName = file.path.split('/').last;
      final multipartFile = await MultipartFile.fromFile(
        profileImagePath,
        filename: fileName,
      );

      response = await _dioClient.uploadFiles(
        ApiConstants.completeProfile,
        files: {'profile_image': multipartFile},
        extraFields: request.toJson(),
        method: HttpMethod.post,
      );
    }

    final data = response.data['data'] as Map<String, dynamic>;
    return EmployeeProfileDto.fromJson(data);
  }

  @override
  Future<EmployeeProfileDto> updateProfile({
    required UpdateProfileRequestDto request,
    String? avatarPath,
  }) async {
    Response response;

    if (avatarPath == null || avatarPath.isEmpty) {
      response = await _dioClient.put(
        ApiConstants.updateProfile,
        data: request.toJson(),
      );
    } else {
      final file = File(avatarPath);
      if (!file.existsSync()) {
        throw const ValidationException(message: 'Avatar file does not exist');
      }

      final fileName = file.path.split('/').last;
      final multipartFile = await MultipartFile.fromFile(
        avatarPath,
        filename: fileName,
      );

      response = await _dioClient.uploadFiles(
        ApiConstants.updateProfile,
        files: {'profile_image': multipartFile},
        extraFields: request.toJson(),
        method: HttpMethod.put,
      );
    }

    final data = response.data['data'] as Map<String, dynamic>;
    return EmployeeProfileDto.fromJson(data);
  }


  @override
  Future<UploadImageResponseDto> uploadProfileImage(String filePath) async {
    final file = File(filePath);

    if (!file.existsSync()) {
      throw const ValidationException(message: 'Avatar file does not exist');
    }

    final fileName = file.path.split('/').last;
    final multipartFile = await MultipartFile.fromFile(
      filePath,
      filename: fileName,
    );

    final response = await _dioClient.uploadFiles(
      ApiConstants.uploadProfileImage,
      files: {'image': multipartFile},
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return UploadImageResponseDto.fromJson(data);
  }

  // @override
  // Future<PayrollDto> getPayrollDetail(int id) async {
  //   final response = await _dioClient.get('${ApiConstants.getPayrollDetail}/$id');
  //   final data = response.data['data'] as Map<String, dynamic>;
  //   return PayrollDto.fromJson(data);
  // }

  @override
  Future<List<PayrollDto>> getPayrollHistory() async {
    final response = await _dioClient.get(ApiConstants.getPayrollHistory);

    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => PayrollDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OfficeAssetsDto>> getOfficeAssets() async {
    final response = await _dioClient.get(ApiConstants.getOfficeAssets);

    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => OfficeAssetsDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}