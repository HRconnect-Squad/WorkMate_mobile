import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';
import 'auth_remote_data_source.dart';
import 'dto/request/change_password_request_dto.dart';
import 'dto/request/login_request.dart';
import 'dto/request/register_dto_request.dart';
import 'dto/request/reset_password_request.dart';
import 'dto/request/verify_otp_request.dart';
import 'dto/response/forgot_password_response.dart';
import 'dto/response/reset_password_response.dart';
import 'dto/request/forgot_password_request.dart';
import 'dto/response/otp_verify_response.dart';
import 'dto/response/login_response.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImp({required DioClient dioClient})
    : _dioClient = dioClient;

  @override
  Future<ForgotPasswordResponse> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    final response = await _dioClient.post(
      ApiConstants.forgotPassword,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ForgotPasswordResponse.fromJson(data);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest request,
  ) async {
    final response = await _dioClient.post(
      ApiConstants.verifyForgotPasswordOtp,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ResetPasswordResponse.fromJson(data);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dioClient.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return LoginResponse.fromJson(data);
  }

  @override
  Future<bool> register({
    required RegisterDtoRequest registerDtoRequest,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.register,
      data: registerDtoRequest.toJson(),
    );
    return response.data['success'] as bool? ?? false;
  }

  @override
  Future<OtpVerifyResponse> verifyOTP({
    required VerifyOtpRequest verifyOtpDto,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.verifyOtp,
      data: verifyOtpDto.toJson(),
    );
    return OtpVerifyResponse.fromJson(response.data['data']);
  }

  @override
  Future<bool> changePassword({required String currentPassword,
    required String newPassword, required String newPasswordConfirmation}) async {
    final request = ChangePasswordRequestDto(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );
    final response = await _dioClient.post(
      ApiConstants.changePassword,
      data: request.toJson(),
    );
    return response.data['success'] as bool? ?? false;
  }
}
