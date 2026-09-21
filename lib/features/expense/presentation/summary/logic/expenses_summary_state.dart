import 'package:equatable/equatable.dart';
import '../../../domain/entity/expense.dart';
import '../../../domain/entity/expense_category.dart';

class ExpensesSummaryState extends Equatable {
  final ExpenseStatus selectedStatus;
  final Map<ExpenseStatus, List<Expense>> expensesByStatus;
  final bool isLoading;
  final bool isDeleting;
  final bool isDeleteSuccess;
  final String? error;
  final String? deleteError;

  const ExpensesSummaryState({
    this.selectedStatus = ExpenseStatus.pending,
    this.expensesByStatus = const {},
    this.isLoading = false,
    this.isDeleting = false,
    this.isDeleteSuccess = false,
    this.error,
    this.deleteError,
  });

  List<Expense> get currentExpenses => expensesByStatus[selectedStatus] ?? const [];
  bool get hasLoadedCurrentTab => expensesByStatus.containsKey(selectedStatus);
  bool get isEmpty => currentExpenses.isEmpty;

  ExpensesSummaryState copyWith({
    ExpenseStatus? selectedStatus,
    Map<ExpenseStatus, List<Expense>>? expensesByStatus,
    bool? isLoading,
    bool? isDeleting,
    bool? isDeleteSuccess,
    String? error,
    String? deleteError,
    bool clearError = false,
    bool clearDeleteError = false,
    bool clearDeleteSuccess = false,
  }) {
    return ExpensesSummaryState(
      selectedStatus: selectedStatus ?? this.selectedStatus,
      expensesByStatus: expensesByStatus ?? this.expensesByStatus,
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      isDeleteSuccess: clearDeleteSuccess ? false : (isDeleteSuccess ?? this.isDeleteSuccess),
      error: clearError ? null : (error ?? this.error),
      deleteError: clearDeleteError ? null : (deleteError ?? this.deleteError),
    );
  }

  @override
  List<Object?> get props =>
      [selectedStatus, expensesByStatus, isLoading, isDeleting, isDeleteSuccess, error, deleteError];
}