import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/expense.dart';
import '../failure/expense_failure.dart';
import '../repository/expense_repository.dart';

class DeleteExpenseUseCase {
  final ExpensesRepository _repository;

  const DeleteExpenseUseCase(this._repository);

  Future<Either<Failure, void>> call(Expense expense) {
    if (expense.status.isProcessed) {
      return Future.value(
        const Left(
          ExpenseAlreadyProcessedFailure(),
        ),
      );
    }

    return _repository.deleteExpense(expense.id);
  }
}