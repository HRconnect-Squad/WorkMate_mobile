import '../../../../core/data/util/parsing.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';
import '../datasource/remote/dto/expense_dto.dart';
import '../datasource/remote/dto/request/create_expense_request_dto.dart';
import '../datasource/remote/dto/request/update_expense_request_dto.dart';

class ExpenseMapper {
  ExpenseMapper._();

  static Expense toDomain(ExpenseDto dto) {
    return Expense(
      id: dto.id ?? 0,
      title: dto.title ?? '',
      amount: _parseDouble(dto.amount) ?? 0.0,
      currency: dto.currency ?? 'SAR',
      formattedAmount: dto.formattedAmount,
      category: ExpenseCategory.fromString(dto.category ?? ''),
      expenseDate: DataFormat.parseDate(dto.expenseDate) ?? DateTime.now(),
      description: dto.description,
      receiptPath: dto.receiptPath,
      status: ExpenseStatus.fromString(dto.status ?? ''),
      approvedAt: DataFormat.parseDateTime(dto.approvedAt),
      createdAt: DataFormat.parseDateTime(dto.createdAt),
    );
  }

  static List<Expense> toDomainList(List<ExpenseDto> dtos) {
    return dtos.map((dto) => toDomain(dto)).toList();
  }

  static CreateExpenseRequestDto toCreateRequestDto({
    required String title,
    required double amount,
    required ExpenseCategory category,
    required DateTime expenseDate,
    String? currency,
    String? description,
    String? receiptPath,
  }) {
    return CreateExpenseRequestDto(
      title: title,
      amount: amount,
      category: category.value,
      expenseDate: DataFormat.formatDate(expenseDate),
      currency: currency,
      description: description,
      receiptPath: receiptPath,
    );
  }

  static UpdateExpenseRequestDto toUpdateRequestDto({
    String? title,
    double? amount,
    ExpenseCategory? category,
    DateTime? expenseDate,
    String? description,
    String? receiptPath,
  }) {
    return UpdateExpenseRequestDto(
      title: title,
      amount: amount,
      category: category?.value,
      expenseDate:
      expenseDate != null ? DataFormat.formatDate(expenseDate) : null,
      description: description,
      receiptPath: receiptPath,
    );
  }

  static double? _parseDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    return double.tryParse(value);
  }
}