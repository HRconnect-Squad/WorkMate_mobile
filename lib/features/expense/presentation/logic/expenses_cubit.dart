import 'package:workmate/core/presentation/base_viewmodel/base_cubit.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expense_category.dart';
import '../../domain/usecase/create_expense_usecase.dart';
import '../../domain/usecase/delete_expense_usecase.dart';
import '../../domain/usecase/get_expenses_usecase.dart';
import '../../domain/usecase/upload_receipt_usecase.dart';
import '../logic/expenses_state.dart';

class ExpensesCubit extends BaseCubit<ExpensesState> {
  final GetExpensesUseCase _getExpensesUseCase;
  final DeleteExpenseUseCase _deleteExpenseUseCase;
  final CreateExpenseUseCase _createExpenseUseCase;
  final UploadReceiptUseCase _uploadReceiptUseCase;

  ExpensesCubit({
    required GetExpensesUseCase getExpensesUseCase,
    required DeleteExpenseUseCase deleteExpenseUseCase,
    required CreateExpenseUseCase createExpenseUseCase,
    required UploadReceiptUseCase uploadReceiptUseCase,
  })  : _getExpensesUseCase = getExpensesUseCase,
        _deleteExpenseUseCase = deleteExpenseUseCase,
        _createExpenseUseCase = createExpenseUseCase,
        _uploadReceiptUseCase = uploadReceiptUseCase,
        super(const ExpensesState());

  Future<void> loadExpenses() async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(isLoading: true, clearError: true),
      ),
      call: () => _getExpensesUseCase(status: state.selectedStatus),
      onSuccess: (expenses) => updateState(
            (s) => s.copyWith(isLoading: false, expenses: expenses),
      ),
      onError: (error) => updateState(
            (s) => s.copyWith(isLoading: false, error: error.message),
      ),
    );
  }

  Future<void> onTabChanged(ExpenseStatus status) async {
    if (state.selectedStatus == status) return;
    updateState(
          (s) => s.copyWith(
        selectedStatus: status,
        expenses: [],
        clearError: true,
      ),
    );
    await loadExpenses();
  }

  Future<void> deleteExpense(Expense expense) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(isDeleting: true, clearDeleteError: true),
      ),
      call: () => _deleteExpenseUseCase(expense),
      onSuccess: (_) async {
        updateState(
              (s) => s.copyWith(isDeleting: false, isDeleteSuccess: true),
        );
        await loadExpenses();
      },
      onError: (error) => updateState(
            (s) => s.copyWith(isDeleting: false, deleteError: error.message, clearDeleteSuccess: true),
      ),
    );
  }

  void clearError() =>
      updateState((s) => s.copyWith(clearError: true));

  void clearDeleteError() =>
      updateState((s) => s.copyWith(clearDeleteError: true));

  void clearDeleteSuccess() {
    updateState((s) => s.copyWith(clearDeleteSuccess: true));
  }

  void onCategoryChanged(ExpenseCategory category) {
    updateState(
          (s) => s.copyWith(
        selectedCategory: category,
        clearCategoryError: true,
      ),
    );
  }

  void onDateChanged(DateTime date) {
    updateState(
          (s) => s.copyWith(
        selectedDate: date,
        clearDateError: true,
      ),
    );
  }

  void onAmountChanged(String value) {
    updateState(
          (s) => s.copyWith(
        amount: value,
        clearAmountError: true,
      ),
    );
  }

  void onDescriptionChanged(String value) {
    updateState((s) => s.copyWith(description: value));
  }

  Future<void> uploadReceipt(String filePath) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(
          isUploadingReceipt: true,
          clearUploadReceiptError: true,
        ),
      ),
      call: () => _uploadReceiptUseCase(filePath),
      onSuccess: (result) => updateState(
            (s) => s.copyWith(
          isUploadingReceipt: false,
          receiptPath: result.path,
          receiptUrl: result.url,
        ),
      ),
      onError: (error) => updateState(
            (s) => s.copyWith(
          isUploadingReceipt: false,
          uploadReceiptError: error.message,
        ),
      ),
    );
  }

  void removeReceipt() {
    updateState((s) => s.copyWith(clearReceiptPath: true
    , clearReceiptUrl: true));
  }

  void clearUploadReceiptError() {
    updateState((s) => s.copyWith(clearUploadReceiptError: true));
  }

  Future<void> submitExpense() async {
    if (!_validateForm()) return;

    final amount = double.tryParse(state.amount.trim()) ?? 0.0;

    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(
          isSubmitting: true,
          clearSubmitError: true,
        ),
      ),
      call: () => _createExpenseUseCase(
        title: _generateTitle(state.selectedCategory),
        amount: amount,
        category: state.selectedCategory,
        expenseDate: state.selectedDate ?? DateTime.now(),
        currency: state.currency,
        description: state.description.trim().isEmpty
            ? null
            : state.description.trim(),
        receiptPath: state.receiptPath,
      ),
      onSuccess: (expense) async {
        updateState(
              (s) => s.copyWith(
            isSubmitting: false,
            isSubmitSuccess: true,
          ),
        );
        _resetSubmitForm();

        await loadExpenses();
      },
      onError: (error) => updateState(
            (s) => s.copyWith(
          isSubmitting: false,
          submitError: error.message,
        ),
      ),
    );
  }

  void clearSubmitSuccess() {
    updateState((s) => s.copyWith(isSubmitSuccess: false));
  }

  void clearSubmitError() {
    updateState((s) => s.copyWith(clearSubmitError: true));
  }

  bool _validateForm() {
    bool isValid = true;

    // if (state.selectedCategory == null) {
    //   updateState(
    //         (s) => s.copyWith(categoryError: 'Please select a category'),
    //   );
    //   isValid = false;
    // }

    if (state.selectedDate == null) {
      updateState(
            (s) => s.copyWith(dateError: 'Please select a date'),
      );
      isValid = false;
    }

    if (state.amount.trim().isEmpty) {
      updateState(
            (s) => s.copyWith(amountError: 'Please enter an amount'),
      );
      isValid = false;
    } else {
      final parsed = double.tryParse(state.amount.trim());
      if (parsed == null || parsed <= 0) {
        updateState(
              (s) =>
              s.copyWith(amountError: 'Please enter a valid amount'),
        );
        isValid = false;
      }
    }

    return isValid;
  }

  String _generateTitle(ExpenseCategory category) {
    return category.displayName;
  }

  void _resetSubmitForm() {
    updateState(
          (s) => s.copyWith(
        clearReceiptPath: true,
        clearSelectedCategory: true,
        clearSelectedDate: true,
        amount: '',
        description: '',
        clearAllFormErrors: true,
        isSubmitSuccess: false,
      ),
    );
  }
}