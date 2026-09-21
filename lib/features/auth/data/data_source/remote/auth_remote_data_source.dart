import 'dto/request/check_forgot_password_otp_request_dto.dart';
import 'dto/request/login_request.dart';
import 'dto/request/register_dto_request.dart';
import 'dto/request/reset_password_request.dart';
import 'dto/request/send_otp_request_dto.dart';
import 'dto/request/verify_otp_request.dart';
import 'dto/response/reset_password_response.dart';
import 'dto/response/login_response.dart';
import 'dto/response/otp_verify_response.dart';
import 'dto/response/send_otp_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);

  Future<bool> register({required RegisterDtoRequest registerDtoRequest});

  Future<OtpVerifyResponse> verifyOTP({required VerifyOtpRequest verifyOtpDto});

  Future<SendOtpResponseDto> sendOtp(SendOtpRequestDto request);

  Future<void> checkForgotPasswordOtp(CheckForgotPasswordOtpRequestDto request);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  });
}
