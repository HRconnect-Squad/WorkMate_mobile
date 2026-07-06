import 'package:equatable/equatable.dart';
import 'expense_category.dart';

class Expense extends Equatable {
  final int id;
  final String title;
  final double amount;
  final String currency;
  final String? formattedAmount;
  final ExpenseCategory category;
  final DateTime expenseDate;
  final String? description;
  final String? receiptPath;
  final ExpenseStatus status;
  final DateTime? approvedAt;
  final DateTime? createdAt;

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.currency,
    this.formattedAmount,
    required this.category,
    required this.expenseDate,
    this.description,
    this.receiptPath,
    required this.status,
    this.approvedAt,
    this.createdAt,
  });

  bool get isPending => status.isPending;
  bool get isApproved => status.isApproved;
  bool get isRejected => status.isRejected;

  bool get hasReceipt => receiptPath != null && receiptPath!.isNotEmpty;

  bool get hasDescription =>
      description != null && description!.isNotEmpty;

  String get displayAmount =>
      formattedAmount ?? '$currency ${amount.toStringAsFixed(2)}';

  /// Formatted date: "20 Feb 2026"
  String get formattedExpenseDate {
    return '${expenseDate.day} '
        '${_months[expenseDate.month - 1]} '
        '${expenseDate.year}';
  }

  /// Short date format: "Feb 20"
  String get shortExpenseDate {
    return '${_months[expenseDate.month - 1]} ${expenseDate.day}';
  }

  /// Formatted created date: "06 May 2026"
  String get formattedCreatedAt {
    if (createdAt == null) return '-';
    return '${createdAt!.day} '
        '${_months[createdAt!.month - 1]} '
        '${createdAt!.year}';
  }

  Expense copyWith({
    int? id,
    String? title,
    double? amount,
    String? currency,
    String? formattedAmount,
    ExpenseCategory? category,
    DateTime? expenseDate,
    String? description,
    String? receiptPath,
    ExpenseStatus? status,
    DateTime? approvedAt,
    DateTime? createdAt,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      formattedAmount: formattedAmount ?? this.formattedAmount,
      category: category ?? this.category,
      expenseDate: expenseDate ?? this.expenseDate,
      description: description ?? this.description,
      receiptPath: receiptPath ?? this.receiptPath,
      status: status ?? this.status,
      approvedAt: approvedAt ?? this.approvedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    amount,
    currency,
    formattedAmount,
    category,
    expenseDate,
    description,
    receiptPath,
    status,
    approvedAt,
    createdAt,
  ];
}