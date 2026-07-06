sealed class UiError {
  final String message;
  const UiError(this.message);
}

class GenericUiError extends UiError {
  const GenericUiError(super.message);
}

class NetworkUiError extends UiError {
  const NetworkUiError([super.message = 'Please check your internet connection']);
}

class TimeoutUiError extends UiError {
  const TimeoutUiError([super.message = 'Connection timed out. Please try again']);
}

class UnauthorizedUiError extends UiError {
  const UnauthorizedUiError([super.message = 'Session expired. Please sign in again']);
}

class InvalidCredentialsUiError extends UiError {
  const InvalidCredentialsUiError([super.message = 'Invalid email or password']);
}

class InvalidOtpUiError extends UiError {
  const InvalidOtpUiError([super.message = 'Invalid or expired OTP code']);
}

class AccountExistsUiError extends UiError {
  const AccountExistsUiError([super.message = 'An account already exists with this email']);
}

class AccountNotVerifiedUiError extends UiError {
  const AccountNotVerifiedUiError([super.message = 'Please verify your account first']);
}

class AccountDisabledUiError extends UiError {
  const AccountDisabledUiError([super.message = 'Your account has been disabled']);
}

class TooManyAttemptsUiError extends UiError {
  const TooManyAttemptsUiError([super.message = 'Too many attempts. Please try again later']);
}

class ServerUiError extends UiError {
  const ServerUiError([super.message = 'Something went wrong. Please try again later']);
}

class NotFoundUiError extends UiError {
  const NotFoundUiError([super.message = 'Resource not found']);
}

class ValidationUiError extends UiError {
  final Map<String, List<String>>? fieldErrors;

  const ValidationUiError({
    String message = 'Please check your input',
    this.fieldErrors,
  }): super(message);

  String? getFieldError(String field) => fieldErrors?[field]?.firstOrNull;
}

class CacheUiError extends UiError {
  const CacheUiError([super.message = 'Failed to load data']);
}

class UnknownUiError extends UiError {
  const UnknownUiError([super.message = 'An unexpected error occurred']);
}

class ProfileUpdateUiError extends UiError {
  const ProfileUpdateUiError([super.message = 'Failed to update profile']);
}
class ProfileNotCompletedUiError extends UiError {
  const ProfileNotCompletedUiError([super.message = 'Profile not completed yet.']);
}
class ProfileFetchUiError extends UiError {
  const ProfileFetchUiError([super.message = 'Failed to fetch profile']);
}
class ProfileImageUploadUiError extends UiError {
  const ProfileImageUploadUiError([super.message = 'Failed to upload profile image']);
}

class PayrollFetchUiError extends UiError {
  const PayrollFetchUiError([super.message = 'Failed to load payroll data']);
}

class PayrollNotFoundUiError extends UiError {
  const PayrollNotFoundUiError([super.message = 'Payroll record not found']);
}

class ProfileAlreadyExistsUiError extends UiError {
  const ProfileAlreadyExistsUiError([
    super.message = 'Profile already exists. Use update instead.',
  ]);
}

class ChangePasswordUiError extends UiError {
  const ChangePasswordUiError([super.message = 'Failed to change password']);
}

class SamePasswordUiError extends UiError {
  const SamePasswordUiError([
    super.message = 'New password must be different from the current password.',
  ]);
}

class InvalidCurrentPasswordUiError extends UiError {
  const InvalidCurrentPasswordUiError([
    super.message = 'Current password is incorrect.',
  ]);
}

class ExpenseFetchUiError extends UiError {
  const ExpenseFetchUiError([super.message = 'Failed to load expenses']);
}

class ExpenseNotFoundUiError extends UiError {
  const ExpenseNotFoundUiError([super.message = 'Expense not found']);
}

class ExpenseAlreadyProcessedUiError extends UiError {
  const ExpenseAlreadyProcessedUiError([
    super.message = 'Cannot modify a processed expense',
  ]);
}

class ExpenseCreateUiError extends UiError {
  const ExpenseCreateUiError([super.message = 'Failed to submit expense']);
}

class ExpenseUpdateUiError extends UiError {
  const ExpenseUpdateUiError([super.message = 'Failed to update expense']);
}

class ExpenseDeleteUiError extends UiError {
  const ExpenseDeleteUiError([super.message = 'Failed to delete expense']);
}

class ReceiptUploadUiError extends UiError {
  const ReceiptUploadUiError([super.message = 'Failed to upload receipt']);
}

