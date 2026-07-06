class CreateExpenseRequestDto {
  final String title;
  final double amount;
  final String? currency;
  final String category;
  final String expenseDate;
  final String? description;
  final String? receiptPath;

  const CreateExpenseRequestDto({
    required this.title,
    required this.amount,
    required this.category,
    required this.expenseDate,
    this.currency,
    this.description,
    this.receiptPath,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'title': title,
      'amount': amount,
      'category': category,
      'expense_date': expenseDate,
    };

    if (currency != null && currency!.isNotEmpty) {
      data['currency'] = currency;
    }
    if (description != null && description!.isNotEmpty) {
      data['description'] = description;
    }
    if (receiptPath != null && receiptPath!.isNotEmpty) {
      data['receipt_path'] = receiptPath;
    }

    return data;
  }
}