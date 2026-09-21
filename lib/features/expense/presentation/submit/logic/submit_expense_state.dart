import 'package:equatable/equatable.dart';
import '../../../../../core/config/app_constant.dart';
import '../../../domain/entity/expense_category.dart';

class SubmitExpenseState extends Equatable {
  final String? receiptPath;
  final String? receiptUrl;
  final bool isUploadingReceipt;
  final String? uploadReceiptError;

  final ExpenseCategory selectedCategory;
  final DateTime? selectedDate;
  final String currency;
  final String amount;
  final String description;

  final String? categoryError;
  final String? dateError;
  final String? amountError;

  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  const SubmitExpenseState({
    this.receiptPath,
    this.receiptUrl,
    this.isUploadingReceipt = false,
    this.uploadReceiptError,
    this.selectedCategory = ExpenseCategory.other,
    this.selectedDate,
    this.currency = AppConstant.defaultCurrency,
    this.amount = '',
    this.description = '',
    this.categoryError,
    this.dateError,
    this.amountError,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  bool get hasReceipt => receiptPath != null && receiptPath!.isNotEmpty;
  bool get isFormValid => selectedDate != null && amount.trim().isNotEmpty;

  SubmitExpenseState copyWith({
    String? receiptPath,
    String? receiptUrl,
    bool? isUploadingReceipt,
    String? uploadReceiptError,
    ExpenseCategory? selectedCategory,
    DateTime? selectedDate,
    String? currency,
    String? amount,
    String? description,
    String? categoryError,
    String? dateError,
    String? amountError,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
    bool clearReceiptPath = false,
    bool clearReceiptUrl = false,
    bool clearUploadReceiptError = false,
    bool clearSelectedDate = false,
    bool clearCategoryError = false,
    bool clearDateError = false,
    bool clearAmountError = false,
    bool clearAllFormErrors = false,
    bool clearError = false,
  }) {
    return SubmitExpenseState(
      receiptPath: clearReceiptPath ? null : (receiptPath ?? this.receiptPath),
      receiptUrl: clearReceiptUrl ? null : (receiptUrl ?? this.receiptUrl),
      isUploadingReceipt: isUploadingReceipt ?? this.isUploadingReceipt,
      uploadReceiptError: clearUploadReceiptError ? null : (uploadReceiptError ?? this.uploadReceiptError),
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedDate: clearSelectedDate ? null : (selectedDate ?? this.selectedDate),
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      categoryError: (clearCategoryError || clearAllFormErrors) ? null : (categoryError ?? this.categoryError),
      dateError: (clearDateError || clearAllFormErrors) ? null : (dateError ?? this.dateError),
      amountError: (clearAmountError || clearAllFormErrors) ? null : (amountError ?? this.amountError),
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [
    receiptPath, receiptUrl, isUploadingReceipt, uploadReceiptError,
    selectedCategory, selectedDate, currency, amount, description,
    categoryError, dateError, amountError, isSubmitting, isSuccess, error,
  ];
}