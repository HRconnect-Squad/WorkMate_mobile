import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../../domain/failure/leave_failure.dart';

abstract final class LeaveFailureMapper {
  const LeaveFailureMapper._();

  static Failure? fromException(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    final data = exception.apiError?.validationErrors;


    if (code != null) {
      final byCode = _fromErrorCode(code, exception.message, data);
      if (byCode != null) return byCode;
    }

    if (exception is ValidationException) {
      return ValidationFailure(
        message: exception.message,
        errors: exception.apiError?.validationErrors,
      );
    }

    return null;
  }

  static Failure? _fromErrorCode(String code, String message, ValidationErrors? data) {
    return switch (code) {
      'INSUFFICIENT_LEAVE_BALANCE' => InsufficientLeaveBalanceFailure(
        message: message,
        requestedDays: _extractInt(data?.fields['requested_days']),
        remainingBalance: _extractInt(data?.fields['remaining_balance']),
      ),
      'LEAVE_NOT_FOUND' || 'MODEL_NOT_FOUND' => LeaveRequestNotFoundFailure(message: message),
      _ => null,
    };
  }

  static int? _extractInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is List && value.isNotEmpty) {
      final first = value.first;
      if (first is int) return first;
      if (first is String) return int.tryParse(first);
    }
    if (value is String) return int.tryParse(value);
    return null;
  }
}