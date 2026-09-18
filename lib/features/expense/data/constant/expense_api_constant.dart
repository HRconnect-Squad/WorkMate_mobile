class ExpenseApiConstant {
  const ExpenseApiConstant._();

  static const String expenses = '/api/expenses';
  static const String uploadReceipt= '/api/uploads/receipt';
  static String modifyExpense(int id) => '/api/expenses/$id';
  static String deleteExpense(int id) => '/api/expenses/$id';
}