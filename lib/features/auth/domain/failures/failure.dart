import '../../../../core/domain/failure/domain_failure.dart';

sealed class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure([
    super.message = 'Invalid email or password',
  ]);
}

class SessionExpiredFailure extends AuthFailure {
  const SessionExpiredFailure([
    super.message = 'Session expired. Please sign in again',
  ]);
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure([super.message = 'User not found']);
}

class InvalidOtpFailure extends AuthFailure {
  const InvalidOtpFailure([super.message = 'Invalid or expired OTP code']);
}

class OtpExpiredFailure extends AuthFailure {
  const OtpExpiredFailure([
    super.message = 'OTP code has expired. Please request a new one',
  ]);
}

class EmailAlreadyExistsFailure extends AuthFailure {
  const EmailAlreadyExistsFailure([
    super.message = 'An account with this email already exists',
  ]);
}

class PhoneAlreadyExistsFailure extends AuthFailure {
  const PhoneAlreadyExistsFailure([
    super.message = 'An account with this phone already exists',
  ]);
}

class AccountNotVerifiedFailure extends AuthFailure {
  const AccountNotVerifiedFailure([
    super.message = 'Please verify your account first',
  ]);
}

class AccountDisabledFailure extends AuthFailure {
  const AccountDisabledFailure([
    super.message = 'Your account has been disabled',
  ]);
}

class TooManyAttemptsFailure extends AuthFailure {
  const TooManyAttemptsFailure([
    super.message = 'Too many attempts. Please try again later',
  ]);
}

class ValidationFailure extends AuthFailure {
  final Map<String, List<String>>? fieldErrors;

  const ValidationFailure({
    String message = 'Please check your input',
    this.fieldErrors,
  }) : super(message);

  String? getFieldError(String field) => fieldErrors?[field]?.firstOrNull;

  String get allErrors =>
      fieldErrors?.values.expand((e) => e).join('\n') ?? message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ValidationFailure &&
          fieldErrors == other.fieldErrors;

  @override
  int get hashCode => Object.hash(super.hashCode, fieldErrors);
}

class ChangePasswordFailure extends AuthFailure {
  const ChangePasswordFailure([
    super.message = 'Failed to change password',
  ]);
}

class SamePasswordFailure extends AuthFailure {
  const SamePasswordFailure([
    super.message = 'New password must be different from the current password.',
  ]);
}

class InvalidCurrentPasswordFailure extends AuthFailure {
  const InvalidCurrentPasswordFailure([
    super.message = 'Current password is incorrect.',
  ]);
}
