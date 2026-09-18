import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/expense.dart';
import '../entity/expense_category.dart';
import '../failure/expense_failure.dart';
import '../repository/expense_repository.dart';

class UpdateExpenseUseCase {
  final ExpensesRepository _repository;

  const UpdateExpenseUseCase(this._repository);

  Future<Either<Failure, Expense>> call({
    required Expense expense,
    String? title,
    double? amount,
    ExpenseCategory? category,
    DateTime? expenseDate,
    String? description,
    String? receiptPath,
  }) {
    if (expense.status.isProcessed) {
      return Future.value(
        const Left(ExpenseAlreadyProcessedFailure()),
      );
    }

    final hasNoChanges = title == null &&
        amount == null &&
        category == null &&
        expenseDate == null &&
        description == null &&
        receiptPath == null;

    if (hasNoChanges) {
      return Future.value(
        const Left(
          ValidationFailure(message: 'No changes provided to update'),
        ),
      );
    }

    final validationErrors = _validate(
      title: title,
      amount: amount,
      expenseDate: expenseDate,
    );

    if (validationErrors != null) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: validationErrors,
      )));
    }

    return _repository.updateExpense(
      id: expense.id,
      title: title,
      amount: amount,
      category: category,
      expenseDate: expenseDate,
      description: description,
      receiptPath: receiptPath,
    );
  }

  ValidationErrors? _validate({
    String? title,
    double? amount,
    DateTime? expenseDate,
  }) {
    final fields = <String, List<String>>{};

    if (title != null && title.trim().isEmpty) {
      fields['title'] = ['Title cannot be empty'];
    }

    if (amount != null && amount <= 0) {
      fields['amount'] = ['Amount must be greater than zero'];
    }

    if (expenseDate != null && expenseDate.isAfter(DateTime.now())) {
      fields['expense_date'] = ['Expense date cannot be in the future'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}