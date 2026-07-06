import 'dto/expense_dto.dart';
import 'dto/request/create_expense_request_dto.dart';
import 'dto/request/update_expense_request_dto.dart';
import 'dto/response/receipt_upload_response_dto.dart';

abstract class ExpensesRemoteDataSource {
  Future<List<ExpenseDto>> getExpenses({
    String? status,
    String? category,
  });

  Future<ExpenseDto> getExpenseDetail(int id);

  Future<ExpenseDto> createExpense({
    required CreateExpenseRequestDto request,
  });

  Future<ExpenseDto> updateExpense({
    required int id,
    required UpdateExpenseRequestDto request,
  });

  Future<void> deleteExpense(int id);

  Future<ReceiptUploadResponseDto> uploadReceipt(String filePath);
}