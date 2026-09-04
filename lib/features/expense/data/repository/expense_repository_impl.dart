import 'package:fpdart/fpdart.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';
import '../../domain/repository/expense_repository.dart';
import '../datasource/remote/expense_remote_data_source.dart';
import '../mapper/expense_failure_mapper.dart';
import '../mapper/expense_mapper.dart';

class ExpensesRepositoryImpl with SafeApiCall implements ExpensesRepository {
  final ExpensesRemoteDataSource _remoteDataSource;

  const ExpensesRepositoryImpl({
    required ExpensesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Expense>>> getExpenses({
    ExpenseStatus? status,
    ExpenseCategory? category,
  }) =>
      safeApiCall(
        call: () async {
          final dtos = await _remoteDataSource.getExpenses(
            status: status?.value,
            category: category?.value,
          );
          return ExpenseMapper.toDomainList(dtos);
        },
        onException: ExpenseFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, Expense>> getExpenseDetail(int id) =>
      safeApiCall(
        call: () async {
          final dto = await _remoteDataSource.getExpenseDetail(id);
          return ExpenseMapper.toDomain(dto);
        },
        onException: ExpenseFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, Expense>> createExpense({
    required String title,
    required double amount,
    required ExpenseCategory category,
    required DateTime expenseDate,
    String? currency,
    String? description,
    String? receiptPath,
  }) =>
      safeApiCall(
        call: () async {
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
          return ExpenseMapper.toDomain(dto);
        },
        onException: ExpenseFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, Expense>> updateExpense({
    required int id,
    String? title,
    double? amount,
    ExpenseCategory? category,
    DateTime? expenseDate,
    String? description,
    String? receiptPath,
  }) =>
      safeApiCall(
        call: () async {
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
          return ExpenseMapper.toDomain(dto);
        },
        onException: ExpenseFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, Unit>> deleteExpense(int id) =>
      safeApiCall(
        call: () async {
          await _remoteDataSource.deleteExpense(id);
          return unit;
        },
        onException: ExpenseFailureMapper.mapException,
      );

  @override
  Future<Either<Failure, ({String path, String url})>> uploadReceipt(
      String filePath,
      ) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.uploadReceipt(filePath);
          return (path: response.path, url: response.url);
        },
        onException: ExpenseFailureMapper.mapException,
      );
}