import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/entity/expense_category.dart';
import '../../../domain/usecase/create_expense_usecase.dart';
import '../../../domain/usecase/upload_receipt_usecase.dart';
import '../../mapper/expense_failure_ui_mapper.dart';
import 'submit_expense_state.dart';

class SubmitExpenseCubit extends BaseCubit<SubmitExpenseState> {
  final CreateExpenseUseCase _createExpenseUseCase;
  final UploadReceiptUseCase _uploadReceiptUseCase;

  SubmitExpenseCubit({
    required CreateExpenseUseCase createExpenseUseCase,
    required UploadReceiptUseCase uploadReceiptUseCase,
  })  : _createExpenseUseCase = createExpenseUseCase,
        _uploadReceiptUseCase = uploadReceiptUseCase,
        super(const SubmitExpenseState());

  void onCategoryChanged(ExpenseCategory category) {
    updateState((s) => s.copyWith(selectedCategory: category, clearCategoryError: true));
  }

  void onDateChanged(DateTime date) {
    updateState((s) => s.copyWith(selectedDate: date, clearDateError: true));
  }

  void onAmountChanged(String value) {
    updateState((s) => s.copyWith(amount: value, clearAmountError: true));
  }

  void onDescriptionChanged(String value) {
    updateState((s) => s.copyWith(description: value));
  }

  Future<void> uploadReceipt(String filePath) async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isUploadingReceipt: true, clearUploadReceiptError: true)),
      call: () => _uploadReceiptUseCase(filePath),
      onSuccess: (result) => updateState((s) => s.copyWith(
        isUploadingReceipt: false,
        receiptPath: result.path,
        receiptUrl: result.url,
      )),
      onError: (failure) => updateState((s) => s.copyWith(
        isUploadingReceipt: false,
        uploadReceiptError: ExpenseFailureUiMapper.map(failure),
      )),
    );
  }

  void removeReceipt() {
    updateState((s) => s.copyWith(clearReceiptPath: true, clearReceiptUrl: true));
  }

  void clearUploadReceiptError() => updateState((s) => s.copyWith(clearUploadReceiptError: true));

  bool _validateForm() {
    bool isValid = true;

    if (state.selectedDate == null) {
      updateState((s) => s.copyWith(dateError: 'please_select_date'.tr()));
      isValid = false;
    }

    if (state.amount.trim().isEmpty) {
      updateState((s) => s.copyWith(amountError: 'please_enter_amount'.tr()));
      isValid = false;
    } else {
      final parsed = double.tryParse(state.amount.trim());
      if (parsed == null || parsed <= 0) {
        updateState((s) => s.copyWith(amountError: 'please_enter_valid_amount'.tr()));
        isValid = false;
      }
    }

    return isValid;
  }

  Future<void> submit() async {
    if (!_validateForm()) return;

    final amount = double.tryParse(state.amount.trim()) ?? 0.0;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(isSubmitting: true, clearError: true)),
      call: () => _createExpenseUseCase(
        title: state.selectedCategory.displayName,
        amount: amount,
        category: state.selectedCategory,
        expenseDate: state.selectedDate ?? DateTime.now(),
        currency: state.currency,
        description: state.description.trim().isEmpty ? null : state.description.trim(),
        receiptPath: state.receiptPath,
      ),
      onSuccess: (_) => updateState((s) => s.copyWith(isSubmitting: false, isSuccess: true)),
      onError: (failure) => updateState((s) => s.copyWith(
        isSubmitting: false,
        error: ExpenseFailureUiMapper.map(failure),
      )),
    );
  }

  void clearError() => updateState((s) => s.copyWith(clearError: true));
}