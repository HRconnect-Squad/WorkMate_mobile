import '../../../../core/domain/failure/domain_failure.dart';

sealed class ExpenseFailure extends Failure {
  const ExpenseFailure({required super.message});
}

class ExpenseNotFoundFailure extends ExpenseFailure {
  const ExpenseNotFoundFailure({
    super.message = 'Expense not found',
  });
}

class ExpenseAlreadyProcessedFailure extends ExpenseFailure {
  const ExpenseAlreadyProcessedFailure({
    super.message = 'Cannot modify a processed expense',
  });
}

class ReceiptUploadFailure extends ExpenseFailure {
  const ReceiptUploadFailure({
    super.message = 'Failed to upload receipt',
  });
}