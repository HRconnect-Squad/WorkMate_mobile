import '../../../../core/data/exception/app_exception.dart';
import '../../domain/failures/failure.dart';

class AuthFailureMapper {
  const AuthFailureMapper._();

  static AuthFailure? mapException(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    if (code != null) {
      final byCode = _mapByErrorCode(code, exception.message);
      if (byCode != null) return byCode;
    }

    switch (exception) {
      case UnauthorizedException():
        return SessionExpiredFailure(message: exception.message);

      case InvalidCredentialsException():
        return InvalidCredentialsFailure(message: exception.message);

      // case ServerException():
      // case BadRequestException():
      // case ForbiddenException():
      //   return _mapErrorCodeException(exception);

      default:
        return null;
    }
  }

  static AuthFailure? _mapByErrorCode(String code, String message) {
    return switch (code) {
      'USER_NOT_FOUND' ||
      'MODEL_NOT_FOUND' ||
      'USER_NOT_REGISTERED'      => UserNotFoundFailure(message: message),
      'ACCOUNT_DISABLED'         => AccountDisabledFailure(message: message),
      'ACCOUNT_NOT_VERIFIED'     => AccountNotVerifiedFailure(message: message),
      'EMAIL_EXISTS'             => EmailAlreadyExistsFailure(message: message),
      'PHONE_EXISTS'             => PhoneAlreadyExistsFailure(message: message),
      'SAME_PASSWORD'            => SamePasswordFailure(message: message),
      'INVALID_CURRENT_PASSWORD' ||
      'WRONG_PASSWORD'           => InvalidCurrentPasswordFailure(message: message),
      'CHANGE_PASSWORD_FAILED'   => ChangePasswordFailure(message: message),
      'INVALID_OTP'              => InvalidOtpFailure(message: message),
      'INVALID_CREDENTIALS'      => InvalidCredentialsFailure(message: message),
      _                          => null,
    };
  }
}
