class ExpenseDto {
  final int? id;
  final String? title;
  final String? amount;
  final String? currency;
  final String? formattedAmount;
  final String? category;
  final String? expenseDate;
  final String? description;
  final String? receiptPath;
  final String? status;
  final String? approvedAt;
  final String? createdAt;

  const ExpenseDto({
    this.id,
    this.title,
    this.amount,
    this.currency,
    this.formattedAmount,
    this.category,
    this.expenseDate,
    this.description,
    this.receiptPath,
    this.status,
    this.approvedAt,
    this.createdAt,
  });

  factory ExpenseDto.fromJson(Map<String, dynamic> json) {
    return ExpenseDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      amount: json['amount']?.toString(),
      currency: json['currency'] as String?,
      formattedAmount: json['formatted_amount'] as String?,
      category: json['category'] as String?,
      expenseDate: json['expense_date'] as String?,
      description: json['description'] as String?,
      receiptPath: json['receipt_path'] as String?,
      status: json['status'] as String?,
      approvedAt: json['approved_at'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'currency': currency,
      'formatted_amount': formattedAmount,
      'category': category,
      'expense_date': expenseDate,
      'description': description,
      'receipt_path': receiptPath,
      'status': status,
      'approved_at': approvedAt,
      'created_at': createdAt,
    };
  }
}