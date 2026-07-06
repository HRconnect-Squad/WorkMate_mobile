import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
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
}