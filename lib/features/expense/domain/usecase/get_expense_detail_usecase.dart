import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/expense.dart';
import '../repository/expense_repository.dart';

class GetExpenseDetailUseCase {
  final ExpensesRepository _repository;

  const GetExpenseDetailUseCase(this._repository);

  Future<Either<Failure, Expense>> call(int id) {
    return _repository.getExpenseDetail(id);
  }
}