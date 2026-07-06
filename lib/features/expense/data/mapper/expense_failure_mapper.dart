import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../auth/domain/failures/failure.dart';
import '../../domain/failure/expense_failure.dart';

class ExpenseFailureMapper {
  const ExpenseFailureMapper._();

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

    if (exception is UnauthorizedException) {
      return const SessionExpiredFailure();
    }

    if (exception is ValidationException) {
      return ExpenseValidationFailure(
        message: exception.message,
        fieldErrors: exception.errors,
      );
    }

    if (exception is AppException) {
      return UnknownFailure(exception.message);
    }

    return UnknownFailure(exception.toString());
  }

  static Failure _mapServerException(ServerException exception) {
    final code = exception.code?.toUpperCase();
    final message = exception.message;

    switch (code) {
      case 'EXPENSE_NOT_FOUND':
      case 'MODEL_NOT_FOUND':
        return ExpenseNotFoundFailure(message);
      case 'EXPENSE_ALREADY_PROCESSED':
        return ExpenseAlreadyProcessedFailure(message);
      case 'EXPENSE_FETCH_FAILED':
        return ExpenseFetchFailure(message);
      case 'RECEIPT_UPLOAD_FAILED':
        return ReceiptUploadFailure(message);
    }

    switch (exception.statusCode) {
      case 403:
        return ExpenseAlreadyProcessedFailure(message);
      case 404:
        return ExpenseNotFoundFailure(message);
      default:
        return ServerFailure(message);
    }
  }
}