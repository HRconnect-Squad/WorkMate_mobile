import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';
import '../../domain/repository/expense_repository.dart';
import '../datasource/remote/expense_remote_data_source.dart';
import '../mapper/expense_failure_mapper.dart';
import '../mapper/expense_mapper.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesRemoteDataSource _remoteDataSource;

  const ExpensesRepositoryImpl({
    required ExpensesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Expense>>> getExpenses({
    ExpenseStatus? status,
    ExpenseCategory? category,
  }) async {
    try {
      final dtos = await _remoteDataSource.getExpenses(
        status: status?.value,
        category: category?.value,
      );
      return Right(ExpenseMapper.toDomainList(dtos));
    } catch (e) {
      return Left(ExpenseFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Expense>> getExpenseDetail(int id) async {
    try {
      final dto = await _remoteDataSource.getExpenseDetail(id);
      return Right(ExpenseMapper.toDomain(dto));
    } catch (e) {
      return Left(ExpenseFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Expense>> createExpense({
    required String title,
    required double amount,
    required ExpenseCategory category,
    required DateTime expenseDate,
    String? currency,
    String? description,
    String? receiptPath,
  }) async {
    try {
      final request = ExpenseMapper.toCreateRequestDto(
        title: title,
        amount: amount,
        category: category,
        expenseDate: expenseDate,
        currency: currency,
        description: description,
        receiptPath: receiptPath,
      );
      final dto = await _remoteDataSource.createExpense(request: request);
      return Right(ExpenseMapper.toDomain(dto));
    } catch (e) {
      return Left(ExpenseFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Expense>> updateExpense({
    required int id,
    String? title,
    double? amount,
    ExpenseCategory? category,
    DateTime? expenseDate,
    String? description,
    String? receiptPath,
  }) async {
    try {
      final request = ExpenseMapper.toUpdateRequestDto(
        title: title,
        amount: amount,
        category: category,
        expenseDate: expenseDate,
        description: description,
        receiptPath: receiptPath,
      );
      final dto = await _remoteDataSource.updateExpense(
        id: id,
        request: request,
      );
      return Right(ExpenseMapper.toDomain(dto));
    } catch (e) {
      return Left(ExpenseFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteExpense(int id) async {
    try {
      await _remoteDataSource.deleteExpense(id);
      return const Right(null);
    } catch (e) {
      return Left(ExpenseFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, ({String path, String url})>> uploadReceipt(
      String filePath,
      ) async {
    try {
      final response = await _remoteDataSource.uploadReceipt(filePath);
      return Right((path: response.path, url: response.url));
    } catch (e) {
      return Left(ExpenseFailureMapper.mapException(e));
    }
  }
}