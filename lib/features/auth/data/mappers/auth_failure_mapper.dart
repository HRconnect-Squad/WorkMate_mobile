import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/failures/failure.dart';

class AuthFailureMapper {
  const AuthFailureMapper._();

  static Failure mapException(Object exception) {
    if (exception is ServerException) {
      return _mapServerException(exception);
    }

    if (exception is NetworkException) {
      return const NetworkFailure();
    }

    if (exception is ConnectionTimeoutException) {
      return const TimeoutFailure();
    }

    if (exception is CacheException) {
      return CacheFailure(exception.message);
    }

    if (exception is UnauthorizedException) {
      return const SessionExpiredFailure();
    }

    if (exception is ValidationException) {
      return _mapValidationException(exception);
    }

    if (exception is AppException) {
      return UnknownFailure(exception.message);
    }

    return UnknownFailure(exception.toString());
  }

  // static Failure _mapServerException(ServerException exception) {
  //   switch (exception.statusCode) {
  //     case 401:
  //       return const InvalidCredentialsFailure();
  //     case 403:
  //       return const SessionExpiredFailure();
  //     case 404:
  //       return const UserNotFoundFailure();
  //     case 409:
  //       return const EmailAlreadyExistsFailure();
  //     case 422:
  //       return const ValidationFailure();
  //     case 429:
  //       return const TooManyAttemptsFailure();
  //     default:
  //       return ServerFailure(exception.message);
  //   }
  // }

  static Failure _mapValidationException(ValidationException exception) {
    final errors = exception.errors;
    final message = exception.message;

    if (errors != null) {
      if (_containsError(errors, 'email', ['already', 'taken', 'exists'])) {
        return EmailAlreadyExistsFailure(
          errors['email']?.first ?? 'An account with this email already exists',
        );
      }

      if (_containsError(errors, 'phone', ['already', 'taken', 'exists'])) {
        return PhoneAlreadyExistsFailure(
          errors['phone']?.first ?? 'An account with this phone already exists',
        );
      }

      if (_containsError(errors, 'code', ['invalid', 'incorrect', 'wrong'])) {
        return InvalidOtpFailure(errors['code']?.first ?? 'Invalid OTP code');
      }

      if (_containsError(errors, 'code', ['expired'])) {
        return OtpExpiredFailure(
          errors['code']?.first ?? 'OTP code has expired',
        );
      }
    }

    return ValidationFailure(message: message, fieldErrors: errors);
  }

  static bool _containsError(
    Map<String, List<String>> errors,
    String field,
    List<String> keywords,
  ) {
    final fieldErrors = errors[field];
    if (fieldErrors == null || fieldErrors.isEmpty) return false;

    final errorText = fieldErrors.join(' ').toLowerCase();
    return keywords.any((keyword) => errorText.contains(keyword.toLowerCase()));
  }

  static Failure _mapServerException(ServerException exception) {
    final code = exception.code?.toUpperCase();
    final message = exception.message;

    switch (code) {
      case 'INVALID_CREDENTIALS':
        return InvalidCredentialsFailure(message);
      case 'USER_NOT_FOUND':
      case 'MODEL_NOT_FOUND':
        return UserNotFoundFailure(message);
      case 'ACCOUNT_DISABLED':
        return AccountDisabledFailure(message);
      case 'ACCOUNT_NOT_VERIFIED':
        return AccountNotVerifiedFailure(message);
      case 'TOO_MANY_REQUESTS':
      case 'TOO_MANY_ATTEMPTS':
        return TooManyAttemptsFailure(message);
      case 'EMAIL_EXISTS':
        return EmailAlreadyExistsFailure(message);
      case 'PHONE_EXISTS':
        return PhoneAlreadyExistsFailure(message);
      case 'SAME_PASSWORD':
        return SamePasswordFailure(message);
      case 'INVALID_CURRENT_PASSWORD':
      case 'WRONG_PASSWORD':
        return InvalidCurrentPasswordFailure(message);
      case 'CHANGE_PASSWORD_FAILED':
        return ChangePasswordFailure(message);
    }

    switch (exception.statusCode) {
      case 401:
        return InvalidCredentialsFailure(message);
      case 403:
        return const SessionExpiredFailure();
      case 404:
        return UserNotFoundFailure(message);
      case 409:
        if (message.toLowerCase().contains('phone')) {
          return PhoneAlreadyExistsFailure(message);
        }
        return EmailAlreadyExistsFailure(message);
      case 429:
        return TooManyAttemptsFailure(message);
      default:
        return ServerFailure(message);
    }
  }
}
