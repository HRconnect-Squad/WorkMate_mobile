enum ExpenseCategory {
  travel('travel'),
  meals('meals'),
  supplies('supplies'),
  equipment('equipment'),
  other('other');

  const ExpenseCategory(this.value);

  final String value;

  static ExpenseCategory fromString(String value) {
    return ExpenseCategory.values.firstWhere(
          (e) => e.value.toLowerCase() == value.toLowerCase(),
      orElse: () => ExpenseCategory.other,
    );
  }

  String get displayName {
    return switch (this) {
      ExpenseCategory.travel => 'Travel',
      ExpenseCategory.meals => 'Meals',
      ExpenseCategory.supplies => 'Supplies',
      ExpenseCategory.equipment => 'Equipment',
      ExpenseCategory.other => 'Other',
    };
  }
}

enum ExpenseStatus {
  pending('pending'),
  approved('approved'),
  rejected('rejected');

  const ExpenseStatus(this.value);

  final String value;

  static ExpenseStatus fromString(String value) {
    return ExpenseStatus.values.firstWhere(
          (e) => e.value.toLowerCase() == value.toLowerCase(),
      orElse: () => ExpenseStatus.pending,
    );
  }

  bool get isPending => this == ExpenseStatus.pending;
  bool get isApproved => this == ExpenseStatus.approved;
  bool get isRejected => this == ExpenseStatus.rejected;

  /// Whether the expense can still be modified or deleted
  bool get isProcessed => this != ExpenseStatus.pending;
}