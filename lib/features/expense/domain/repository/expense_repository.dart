import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/expense.dart';
import '../entity/expense_category.dart';

abstract class ExpensesRepository {
  Future<Either<Failure, List<Expense>>> getExpenses({
    ExpenseStatus? status,
    ExpenseCategory? category,
  });

  Future<Either<Failure, Expense>> getExpenseDetail(int id);

  Future<Either<Failure, Expense>> createExpense({
    required String title,
    required double amount,
    required ExpenseCategory category,
    required DateTime expenseDate,
    String? currency,
    String? description,
    String? receiptPath,
  });

  Future<Either<Failure, Expense>> updateExpense({
    required int id,
    String? title,
    double? amount,
    ExpenseCategory? category,
    DateTime? expenseDate,
    String? description,
    String? receiptPath,
  });

  Future<Either<Failure, Unit>> deleteExpense(int id);

  Future<Either<Failure, ({String path, String url})>> uploadReceipt(
      String filePath,
      );
}