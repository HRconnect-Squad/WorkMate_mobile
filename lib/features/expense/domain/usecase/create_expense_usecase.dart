import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/expense.dart';
import '../entity/expense_category.dart';
import '../repository/expense_repository.dart';

class CreateExpenseUseCase {
  final ExpensesRepository _repository;

  const CreateExpenseUseCase(this._repository);

  Future<Either<Failure, Expense>> call({
    required String title,
    required double amount,
    required ExpenseCategory category,
    required DateTime expenseDate,
    String? currency,
    String? description,
    String? receiptPath,
  }) {
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

    return _repository.createExpense(
      title: title,
      amount: amount,
      category: category,
      expenseDate: expenseDate,
      currency: currency,
      description: description,
      receiptPath: receiptPath,
    );
  }

  ValidationErrors? _validate({
    required String title,
    required double amount,
    required DateTime expenseDate,
  }) {
    final fields = <String, List<String>>{};

    if (title.trim().isEmpty) {
      fields['title'] = ['Title cannot be empty'];
    }

    if (amount <= 0) {
      fields['amount'] = ['Amount must be greater than zero'];
    }

    if (expenseDate.isAfter(DateTime.now())) {
      fields['expense_date'] = ['Expense date cannot be in the future'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}