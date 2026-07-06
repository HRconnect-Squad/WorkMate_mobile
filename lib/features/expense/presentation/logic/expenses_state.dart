import 'package:equatable/equatable.dart';
import '../../../../core/config/app_constant.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';

class ExpensesState extends Equatable {
  // ── List Screen
  final List<Expense> expenses;
  final ExpenseStatus? selectedStatus;
  final bool isLoading;
  final bool isDeleting;
  final bool isDeleteSuccess;
  final String? error;
  final String? deleteError;

  // ── Submit Screen
  final String? receiptPath;
  final bool isUploadingReceipt;
  final String? uploadReceiptError;
  final String? receiptUrl;

  final ExpenseCategory selectedCategory;
  final DateTime? selectedDate;
  final String currency;
  final String amount;
  final String description;

  final bool isSubmitting;
  final String? submitError;
  final bool isSubmitSuccess;

  // ── Form Errors
  final String? categoryError;
  final String? dateError;
  final String? amountError;

  const ExpensesState({
    this.expenses = const [],
    this.selectedStatus = ExpenseStatus.pending,
    this.isLoading = false,
    this.isDeleting = false,
    this.error,
    this.deleteError,
    this.isDeleteSuccess = false,

    this.receiptPath,
    this.isUploadingReceipt = false,
    this.uploadReceiptError,
    this.selectedCategory = ExpenseCategory.other,
    this.selectedDate,
    this.amount = '',
    this.currency = AppConstant.defaultCurrency,
    this.description = '',
    this.isSubmitting = false,
    this.submitError,
    this.isSubmitSuccess = false,
    this.receiptUrl,


    this.categoryError,
    this.dateError,
    this.amountError,
  });

  int get pendingCount =>
      expenses.where((e) => e.status.isPending).length;

  int get approvedCount =>
      expenses.where((e) => e.status.isApproved).length;

  int get rejectedCount =>
      expenses.where((e) => e.status.isRejected).length;

  bool get isEmpty => expenses.isEmpty;

  bool get hasReceipt =>
      receiptPath != null && receiptPath!.isNotEmpty;

  bool get isFormValid =>
          selectedDate != null &&
          amount.trim().isNotEmpty;

  ExpensesState copyWith({
    List<Expense>? expenses,
    ExpenseStatus? selectedStatus,
    bool? isLoading,
    bool? isDeleting,
    String? error,
    String? deleteError,
    bool? isDeleteSuccess,
    bool clearError = false,
    bool clearDeleteError = false,

    String? receiptPath,
    String? receiptUrl,
    bool? isUploadingReceipt,
    String? uploadReceiptError,
    ExpenseCategory? selectedCategory,
    DateTime? selectedDate,
    String? amount,
    String? currency,
    String? description,
    bool? isSubmitting,
    String? submitError,
    bool? isSubmitSuccess,

    String? categoryError,
    String? dateError,
    String? amountError,

    bool clearDeleteSuccess = false,
    bool clearReceiptPath = false,
    bool clearReceiptUrl = false,
    bool clearUploadReceiptError = false,
    bool clearSubmitError = false,
    bool clearCategoryError = false,
    bool clearDateError = false,
    bool clearAmountError = false,
    bool clearAllFormErrors = false,
    bool clearSelectedCategory = false,
    bool clearSelectedDate = false,
  }) {
    return ExpensesState(
      expenses: expenses ?? this.expenses,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      error: clearError ? null : (error ?? this.error),
      deleteError:
      clearDeleteError ? null : (deleteError ?? this.deleteError),
      isDeleteSuccess: clearDeleteSuccess ? false
          : (isDeleteSuccess ?? this.isDeleteSuccess),


      receiptPath: clearReceiptPath
          ? null
          : (receiptPath ?? this.receiptPath),
      receiptUrl: clearReceiptUrl
          ? null
          : (receiptUrl ?? this.receiptUrl),
      isUploadingReceipt:
      isUploadingReceipt ?? this.isUploadingReceipt,
      uploadReceiptError: clearUploadReceiptError
          ? null
          : (uploadReceiptError ?? this.uploadReceiptError),
      selectedCategory: clearSelectedCategory
          ? ExpenseCategory.other
          : (selectedCategory ?? this.selectedCategory),
      selectedDate: clearSelectedDate
          ? null
          : (selectedDate ?? this.selectedDate),
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submitError: clearSubmitError
          ? null
          : (submitError ?? this.submitError),
      isSubmitSuccess: isSubmitSuccess ?? this.isSubmitSuccess,

      categoryError: (clearCategoryError || clearAllFormErrors)
          ? null
          : (categoryError ?? this.categoryError),
      dateError: (clearDateError || clearAllFormErrors)
          ? null
          : (dateError ?? this.dateError),
      amountError: (clearAmountError || clearAllFormErrors)
          ? null
          : (amountError ?? this.amountError),
    );
  }

  @override
  List<Object?> get props => [
    expenses,
    selectedStatus,
    isLoading,
    isDeleting,
    error,
    deleteError,
    receiptPath,
    receiptUrl,
    isUploadingReceipt,
    uploadReceiptError,
    selectedCategory,
    selectedDate,
    amount,
    description,
    isSubmitting,
    submitError,
    isSubmitSuccess,
    categoryError,
    dateError,
    amountError,
  ];
}