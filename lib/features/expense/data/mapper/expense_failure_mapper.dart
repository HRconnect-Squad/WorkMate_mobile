import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/failure/expense_failure.dart';

abstract final class ExpenseFailureMapper {
  static Failure? mapException(AppException exception) {
    return switch (exception) {
      NotFoundException() =>
      const ExpenseNotFoundFailure(),

      ForbiddenException() =>
      _fromErrorCode(exception) ??
          const ExpenseAlreadyProcessedFailure(),

      BadRequestException() ||
      ServerException()     =>
          _fromErrorCode(exception),

      ValidationException() =>
          ValidationFailure(
            message: exception.message,
            errors: exception.apiError?.validationErrors,
          ),
      _ => null,
    };
  }

  static Failure? _fromErrorCode(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    final message = exception.message;

    return switch (code) {
      'EXPENSE_NOT_FOUND' ||
      'MODEL_NOT_FOUND'          => ExpenseNotFoundFailure(message: message),
      'EXPENSE_ALREADY_PROCESSED'=> ExpenseAlreadyProcessedFailure(message: message),
      'RECEIPT_UPLOAD_FAILED'    => ReceiptUploadFailure(message: message),
      _                          => null,
    };
  }
}