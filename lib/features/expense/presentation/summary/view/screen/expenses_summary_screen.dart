import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/presentation/design_system/components/app_tab_filter/app_tab_filter.dart';
import '../../../../../../core/presentation/design_system/components/app_tab_filter/app_tab_item.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../../../domain/entity/expense.dart';
import '../../../../domain/entity/expense_category.dart';
import '../../logic/expenses_summary_cubit.dart';
import '../../logic/expenses_summary_state.dart';
import '../widget/expense_card.dart';
import '../widget/expenses_empty_state.dart';
import '../widget/expenses_header.dart';

class ExpensesSummaryScreen extends StatelessWidget {
  const ExpensesSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<ExpensesSummaryCubit, ExpensesSummaryState>(
        listenWhen: (previous, current) =>
        (current.error != null && current.error != previous.error) ||
            (current.deleteError != null && current.deleteError != previous.deleteError) ||
            (current.isDeleteSuccess && !previous.isDeleteSuccess),
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<ExpensesSummaryCubit>().clearError();
          }
          if (state.deleteError != null) {
            SnackBarHelper.showError(context, state.deleteError!);
            context.read<ExpensesSummaryCubit>().clearDeleteError();
          }
          if (state.isDeleteSuccess) {
            SnackBarHelper.showSuccess(context, 'expense_deleted_successfully'.tr());
            context.read<ExpensesSummaryCubit>().clearDeleteSuccess();
          }
        },
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(child: _buildBody(context, state)),
                _buildFloatingButton(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ExpensesSummaryState state) {
    final cubit = context.read<ExpensesSummaryCubit>();

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ExpensesHeader()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AppTabFilter<ExpenseStatus>(
              selectedValue: state.selectedStatus,
              onChanged: cubit.onTabChanged,
              items: [
                AppTabItem(
                  value: ExpenseStatus.pending,
                  label: 'pending'.tr(),
                  count: (state.expensesByStatus[ExpenseStatus.pending] ?? []).length,
                ),
                AppTabItem(value: ExpenseStatus.approved, label: 'approved'.tr()),
                AppTabItem(
                  value: ExpenseStatus.rejected,
                  label: 'rejected'.tr(),
                  count: (state.expensesByStatus[ExpenseStatus.rejected] ?? []).length,
                ),
              ],
            ),
          ),
        ),
        ..._buildListSection(context, state),
        //const SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }

  List<Widget> _buildListSection(BuildContext context, ExpensesSummaryState state) {
    if (state.isLoading && !state.hasLoadedCurrentTab) {
      return [const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))];
    }

    if (state.error != null && state.currentExpenses.isEmpty) {
      return [SliverFillRemaining(hasScrollBody: false, child: _buildErrorState(context))];
    }

    if (state.isEmpty) {
      return [SliverFillRemaining(hasScrollBody: false, child: ExpensesEmptyState(status: state.selectedStatus))];
    }

    return [
      SliverList.builder(
        itemCount: state.currentExpenses.length,
        itemBuilder: (context, index) {
          final expense = state.currentExpenses[index];
          return ExpenseCard(
            expense: expense,
            onTap: () => _onExpenseTap(context, expense),
            onDelete: () => _onDeleteTap(context, expense),
          );
        },
      ),
    ];
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded, size: 64, color: context.colors.error),
            const SizedBox(height: 16),
            Text('failed_to_load_expenses'.tr(),
                style: context.textTheme.titleSmallFont.copyWith(color: context.colors.textPrimary),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text('check_connection_and_retry'.tr(),
                style: context.textTheme.bodySmallFont.copyWith(color: context.colors.textSecondary),
                textAlign: TextAlign.center),
            const SizedBox(height: 24),
            CustomPrimaryButton.outlined(
              buttonText: 'retry'.tr(),
              onPressed: () => context.read<ExpensesSummaryCubit>().loadExpenses(),
              width: 120,
              height: 44,
              borderRadius: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, -4))],
      ),
      child: SafeArea(
        top: false,
        child: CustomPrimaryButton.gradient(
          height: 48,
          borderRadius: 100,
          buttonText: 'submit_expense'.tr(),
          onPressed: () => _onSubmitExpenseTap(context),
        ),
      ),
    );
  }

  void _onExpenseTap(BuildContext context, Expense expense) {
    // TODO: Navigate to expense detail screen
  }

  Future<void> _onSubmitExpenseTap(BuildContext context) async {
    final result = await context.push<bool>(RouteNames.submitExpense);
    if (result == true && context.mounted) {
      context.read<ExpensesSummaryCubit>().refresh();
    }
  }

  void _onDeleteTap(BuildContext context, Expense expense) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('delete_expense'.tr()),
        content: Text('delete_expense_confirmation'.tr(args: [expense.title])),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: Text('cancel'.tr())),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ExpensesSummaryCubit>().deleteExpense(expense);
            },
            child: Text('delete'.tr(), style: TextStyle(color: context.colors.error)),
          ),
        ],
      ),
    );
  }
}