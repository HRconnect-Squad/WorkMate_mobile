import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/expense.dart';
import '../entity/expense_category.dart';
import '../repository/expense_repository.dart';

class GetExpensesUseCase {
  final ExpensesRepository _repository;

  const GetExpensesUseCase(this._repository);

  Future<Either<Failure, List<Expense>>> call({
    ExpenseStatus? status,
    ExpenseCategory? category,
  }) {
    return _repository.getExpenses(
      status: status,
      category: category,
    );
  }
}