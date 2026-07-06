import '../../../../core/domain/failure/domain_failure.dart';

sealed class PayrollFailure extends Failure {
  const PayrollFailure(super.message);
}

class PayrollFetchFailure extends PayrollFailure {
  const PayrollFetchFailure([
    super.message = 'Failed to fetch payroll data',
  ]);
}

class PayrollNotFoundFailure extends PayrollFailure {
  const PayrollNotFoundFailure([
    super.message = 'Payroll record not found',
  ]);
}

class PayrollExportFailure extends PayrollFailure {
  const PayrollExportFailure([
    super.message = 'Failed to export payroll as PDF',
  ]);
}