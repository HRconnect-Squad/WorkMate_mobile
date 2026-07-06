import '../../../../core/domain/failure/domain_failure.dart';

sealed class ExpenseFailure extends Failure {
  const ExpenseFailure(super.message);
}

class ExpenseFetchFailure extends ExpenseFailure {
  const ExpenseFetchFailure([
    super.message = 'Failed to fetch expenses',
  ]);
}

class ExpenseNotFoundFailure extends ExpenseFailure {
  const ExpenseNotFoundFailure([
    super.message = 'Expense not found',
  ]);
}

class ExpenseAlreadyProcessedFailure extends ExpenseFailure {
  const ExpenseAlreadyProcessedFailure([
    super.message = 'Cannot modify a processed expense',
  ]);
}

class ExpenseCreateFailure extends ExpenseFailure {
  const ExpenseCreateFailure([
    super.message = 'Failed to submit expense',
  ]);
}

class ExpenseUpdateFailure extends ExpenseFailure {
  const ExpenseUpdateFailure([
    super.message = 'Failed to update expense',
  ]);
}

class ExpenseDeleteFailure extends ExpenseFailure {
  const ExpenseDeleteFailure([
    super.message = 'Failed to delete expense',
  ]);
}

class ReceiptUploadFailure extends ExpenseFailure {
  const ReceiptUploadFailure([
    super.message = 'Failed to upload receipt',
  ]);
}

class ExpenseValidationFailure extends ExpenseFailure {
  final Map<String, List<String>>? fieldErrors;

  const ExpenseValidationFailure({
    String message = 'Please check your input',
    this.fieldErrors,
  }) : super(message);

  String? getFieldError(String field) => fieldErrors?[field]?.firstOrNull;
}