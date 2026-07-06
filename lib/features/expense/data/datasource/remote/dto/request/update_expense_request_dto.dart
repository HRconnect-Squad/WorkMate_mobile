class UpdateExpenseRequestDto {
  final String? title;
  final double? amount;
  final String? category;
  final String? expenseDate;
  final String? description;
  final String? receiptPath;

  const UpdateExpenseRequestDto({
    this.title,
    this.amount,
    this.category,
    this.expenseDate,
    this.description,
    this.receiptPath,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (title != null && title!.isNotEmpty) data['title'] = title;
    if (amount != null) data['amount'] = amount;
    if (category != null && category!.isNotEmpty) data['category'] = category;
    if (expenseDate != null && expenseDate!.isNotEmpty) {
      data['expense_date'] = expenseDate;
    }
    if (description != null && description!.isNotEmpty) {
      data['description'] = description;
    }
    if (receiptPath != null && receiptPath!.isNotEmpty) {
      data['receipt_path'] = receiptPath;
    }

    return data;
  }

  bool get hasData =>
      (title?.isNotEmpty ?? false) ||
          amount != null ||
          (category?.isNotEmpty ?? false) ||
          (expenseDate?.isNotEmpty ?? false) ||
          (description?.isNotEmpty ?? false) ||
          (receiptPath?.isNotEmpty ?? false);
}