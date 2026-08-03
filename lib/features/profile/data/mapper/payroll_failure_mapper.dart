import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/failure/failure.dart';
import '../../domain/failure/payroll_failure.dart';

abstract final class PayrollFailureMapper {
  const PayrollFailureMapper._();

  static Failure? fromException(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    if (code == null) return null;

    return switch (code) {
      'PAYROLL_NOT_FOUND'     => PayrollNotFoundFailure(message: exception.message),
      'PROFILE_NOT_COMPLETED' => ProfileNotCompletedFailure(message: exception.message),
      _                       => null,
    };
  }
}