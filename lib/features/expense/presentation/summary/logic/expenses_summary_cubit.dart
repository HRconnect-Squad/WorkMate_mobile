import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/entity/expense.dart';
import '../../../domain/entity/expense_category.dart';
import '../../../domain/usecase/delete_expense_usecase.dart';
import '../../../domain/usecase/get_expenses_usecase.dart';
import '../../mapper/expense_failure_ui_mapper.dart';
import 'expenses_summary_state.dart';

class ExpensesSummaryCubit extends BaseCubit<ExpensesSummaryState> {
  final GetExpensesUseCase _getExpensesUseCase;
  final DeleteExpenseUseCase _deleteExpenseUseCase;

  ExpensesSummaryCubit({
    required GetExpensesUseCase getExpensesUseCase,
    required DeleteExpenseUseCase deleteExpenseUseCase,
  })  : _getExpensesUseCase = getExpensesUseCase,
        _deleteExpenseUseCase = deleteExpenseUseCase,
        super(const ExpensesSummaryState());

  Future<void> loadExpenses() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoading: true, clearError: true)),
      call: () => _getExpensesUseCase(status: state.selectedStatus),
      onSuccess: (expenses) => updateState((s) {
        final updated = Map<ExpenseStatus, List<Expense>>.from(s.expensesByStatus)
          ..[s.selectedStatus] = expenses;
        return s.copyWith(isLoading: false, expensesByStatus: updated);
      }),
      onError: (failure) => updateState((s) => s.copyWith(
        isLoading: false,
        error: ExpenseFailureUiMapper.map(failure),
      )),
    );
  }

  Future<void> onTabChanged(ExpenseStatus status) async {
    if (state.selectedStatus == status) return;
    updateState((s) => s.copyWith(selectedStatus: status, clearError: true));
    if (!state.hasLoadedCurrentTab) {
      await loadExpenses();
    }
  }

  Future<void> deleteExpense(Expense expense) async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isDeleting: true, clearDeleteError: true)),
      call: () => _deleteExpenseUseCase(expense),
      onSuccess: (_) async {
        updateState((s) => s.copyWith(isDeleting: false, isDeleteSuccess: true, expensesByStatus: const {}));
        await loadExpenses();
      },
      onError: (failure) => updateState((s) => s.copyWith(
        isDeleting: false,
        deleteError: ExpenseFailureUiMapper.map(failure),
        clearDeleteSuccess: true,
      )),
    );
  }

  Future<void> refresh() async {
    updateState((s) => s.copyWith(expensesByStatus: const {}));
    await loadExpenses();
  }

  void clearError() => updateState((s) => s.copyWith(clearError: true));
  void clearDeleteError() => updateState((s) => s.copyWith(clearDeleteError: true));
  void clearDeleteSuccess() => updateState((s) => s.copyWith(clearDeleteSuccess: true));
}