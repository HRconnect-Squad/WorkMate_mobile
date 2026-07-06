import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../auth/domain/failures/failure.dart';
import '../../domain/failure/payroll_failure.dart';

class PayrollFailureMapper {
  const PayrollFailureMapper._();

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

    if (exception is AppException) {
      return UnknownFailure(exception.message);
    }

    return UnknownFailure(exception.toString());
  }

  static Failure _mapServerException(ServerException exception) {
    final code = exception.code?.toUpperCase();
    final message = exception.message;

    switch (code) {
      case 'PAYROLL_NOT_FOUND':
        return PayrollNotFoundFailure(message);
      case 'PAYROLL_FETCH_FAILED':
        return PayrollFetchFailure(message);
    }

    switch (exception.statusCode) {
      case 404:
        return PayrollNotFoundFailure(message);
      default:
        return ServerFailure(message);
    }
  }
}