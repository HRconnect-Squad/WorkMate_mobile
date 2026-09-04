import 'dart:io';
import 'package:dio/dio.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/payroll_dto.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/response/office_assets_dto.dart';
import 'package:workmate/features/profile/data/datasource/remote/dto/response/upload_image_response_dto.dart';
import 'package:workmate/features/profile/data/datasource/remote/profile_remote_data_source.dart';
import '../../../../../core/data/exception/app_exception.dart';
import '../../../../../core/data/network/dio_client.dart';
import '../../../../../core/data/network/dto/response/api_response.dart';
import '../../constant/profile_api_constant.dart';
import 'dto/employee_profile_dto.dart';
import 'dto/request/complete_profile_request.dart';
import 'dto/request/update_profile_request_dto.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient _dioClient;

  const ProfileRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<EmployeeProfileDto> getProfile() async {
    final response = await _dioClient.get(ProfileApiConstant.getProfile);

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => EmployeeProfileDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<EmployeeProfileDto> completeProfile({
    required CompleteProfileRequestDto request,
    String? profileImagePath,
  }) async {
    final Response response;

    if (profileImagePath == null || profileImagePath.isEmpty) {
      response = await _dioClient.post(
        ProfileApiConstant.completeProfile,
        data: request.toJson(),
      );
    } else {
      if (!File(profileImagePath).existsSync()) {
        throw FileException(
          message: 'Profile image file not found at path: $profileImagePath',
        );
      }

      final multipartFile = await MultipartFile.fromFile(
        profileImagePath,
        filename: profileImagePath.split('/').last,
      );

      response = await _dioClient.uploadFiles(
        path: ProfileApiConstant.completeProfile,
        files: {'profile_image': multipartFile},
        extraFields: request.toJson(),
        method: HttpMethod.post,
      );
    }

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => EmployeeProfileDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<EmployeeProfileDto> updateProfile({
    required UpdateProfileRequestDto request,
    String? avatarPath,
  }) async {
    final Response response;

    if (avatarPath == null || avatarPath.isEmpty) {
      response = await _dioClient.put(
        ProfileApiConstant.updateProfile,
        data: request.toJson(),
      );
    } else {
      if (!File(avatarPath).existsSync()) {
        throw FileException(
          message: 'Avatar file not found at path: $avatarPath',
        );
      }

      final multipartFile = await MultipartFile.fromFile(
        avatarPath,
        filename: avatarPath.split('/').last,
      );

      response = await _dioClient.uploadFiles(
        path: ProfileApiConstant.updateProfile,
        files: {'profile_image': multipartFile},
        extraFields: request.toJson(),
        method: HttpMethod.put,
      );
    }

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => EmployeeProfileDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<UploadImageResponseDto> uploadProfileImage(String filePath) async {
    if (!File(filePath).existsSync()) {
      throw FileException(
        message: 'Image file not found at path: $filePath',
      );
    }

    final multipartFile = await MultipartFile.fromFile(
      filePath,
      filename: filePath.split('/').last,
    );

    final response = await _dioClient.uploadFiles(
      path: ProfileApiConstant.uploadProfileImage,
      files: {'image': multipartFile},
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => UploadImageResponseDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<List<PayrollDto>> getPayrollHistory() async {
    final response = await _dioClient.get(ProfileApiConstant.getPayrollHistory);

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => PayrollDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<List<OfficeAssetsDto>> getOfficeAssets() async {
    final response = await _dioClient.get(ProfileApiConstant.getOfficeAssets);

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => OfficeAssetsDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );

    return apiResponse.requiredData;
  }
}