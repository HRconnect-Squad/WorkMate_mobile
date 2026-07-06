import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
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
        const Left(
          ExpenseAlreadyProcessedFailure(),
        ),
      );
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
}