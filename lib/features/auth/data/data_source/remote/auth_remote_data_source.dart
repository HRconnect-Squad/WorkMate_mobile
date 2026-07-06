import 'dto/request/login_request.dart';
import 'dto/request/register_dto_request.dart';
import 'dto/request/reset_password_request.dart';
import 'dto/request/verify_otp_request.dart';
import 'dto/response/forgot_password_response.dart';
import 'dto/response/reset_password_response.dart';
import 'dto/request/forgot_password_request.dart';
import 'dto/response/login_response.dart';
import 'dto/response/otp_verify_response.dart';

abstract class AuthRemoteDataSource {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);

  Future<LoginResponse> login(LoginRequest request);

  Future<bool> register({required RegisterDtoRequest registerDtoRequest});

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  });

  Future<OtpVerifyResponse> verifyOTP({required VerifyOtpRequest verifyOtpDto});
}
