import '../../../../../core/data/network/dio_client.dart';
import '../../../../../core/data/network/dto/response/api_response.dart';
import '../../constant/auth_api_constant.dart';
import 'auth_remote_data_source.dart';
import 'dto/request/change_password_request_dto.dart';
import 'dto/request/check_forgot_password_otp_request_dto.dart';
import 'dto/request/login_request.dart';
import 'dto/request/register_dto_request.dart';
import 'dto/request/reset_password_request.dart';
import 'dto/request/send_otp_request_dto.dart';
import 'dto/request/verify_otp_request.dart';
import 'dto/response/reset_password_response.dart';
import 'dto/response/otp_verify_response.dart';
import 'dto/response/login_response.dart';
import 'dto/response/send_otp_response_dto.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImp({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dioClient.post(
      AuthApiConstant.login,
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => LoginResponse.fromJson(data),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<bool> register({required RegisterDtoRequest registerDtoRequest}) async {
    final response = await _dioClient.post(
      AuthApiConstant.register,
      data: registerDtoRequest.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(response.data, null);
    return apiResponse.success;
  }

  @override
  Future<OtpVerifyResponse> verifyOTP({required VerifyOtpRequest verifyOtpDto}) async {
    final response = await _dioClient.post(
      AuthApiConstant.verifyOtp,
      data: verifyOtpDto.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => OtpVerifyResponse.fromJson(data),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<SendOtpResponseDto> sendOtp(SendOtpRequestDto request) async {
    final response = await _dioClient.post(
      AuthApiConstant.sendOtp,
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => SendOtpResponseDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<void> checkForgotPasswordOtp(CheckForgotPasswordOtpRequestDto request) async {
    await _dioClient.post(
      AuthApiConstant.checkForgotPasswordOtp,
      data: request.toJson(),
    );
  }

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request) async {
    final response = await _dioClient.post(
      AuthApiConstant.forgotPassword,
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => ResetPasswordResponse.fromJson(data),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    final request = ChangePasswordRequestDto(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );

    final response = await _dioClient.post(
      AuthApiConstant.changePassword,
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(response.data, null);
    return apiResponse.success;
  }
}
