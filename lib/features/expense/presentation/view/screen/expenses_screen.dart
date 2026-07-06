import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../core/presentation/routes/route_names.dart';
import '../../../domain/entity/expense.dart';
import '../../../domain/entity/expense_category.dart';
import '../../logic/expenses_cubit.dart';
import '../../logic/expenses_state.dart';
import '../widget/expense_card.dart';
import '../widget/expenses_empty_state.dart';
import '../widget/expenses_header.dart';
import '../widget/expenses_tab_filter.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<ExpensesCubit, ExpensesState>(
        listenWhen: (previous, current) =>
        (current.error != null &&
            current.error != previous.error) ||
            (current.deleteError != null &&
                current.deleteError != previous.deleteError) ||
            (current.isDeleteSuccess && !previous.isDeleteSuccess),

        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<ExpensesCubit>().clearError();
          }

          if (state.deleteError != null) {
            SnackBarHelper.showError(context, state.deleteError!);
            context.read<ExpensesCubit>().clearDeleteError();
          }

          if (state.isDeleteSuccess) {
            SnackBarHelper.showSuccess(
              context,
              'Expense deleted successfully',
            );
            context.read<ExpensesCubit>().clearDeleteSuccess();
          }
        },
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Stack(
              children: [
                _buildBody(context, state),

                if (state.isDeleting)
                  const Positioned.fill(
                    child: ColoredBox(
                      color: Colors.black26,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildFloatingButton(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ExpensesState state) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: ExpensesHeader(),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ExpensesTabFilter(
              selectedStatus: state.selectedStatus ?? ExpenseStatus.pending,
              pendingCount: state.pendingCount,
              approvedCount: state.approvedCount,
              rejectedCount: state.rejectedCount,
              onTabChanged: context.read<ExpensesCubit>().onTabChanged,
            ),
          ),
        ),

        ..._buildListSection(context, state),

        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  List<Widget> _buildListSection(
      BuildContext context,
      ExpensesState state,
      ) {
    if (state.isLoading) {
      return [
        const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ];
    }

    if (state.error != null && state.expenses.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: _buildErrorState(context),
        ),
      ];
    }

    if (state.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: ExpensesEmptyState(
            status: state.selectedStatus,
          ),
        ),
      ];
    }

    return [
      SliverList.builder(
        itemCount: state.expenses.length,
        itemBuilder: (context, index) {
          final expense = state.expenses[index];
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
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load expenses',
              style: context.textTheme.titleSmallFont.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Please check your connection and try again.',
              style: context.textTheme.bodySmallFont.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomPrimaryButton.outlined(
              buttonText: 'Retry',
              onPressed: () => context.read<ExpensesCubit>().loadExpenses(),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: CustomPrimaryButton.gradient(
          height: 48,
          borderRadius: 100,
          buttonText: 'Submit Expense',
          textStyle: context.textTheme.labelLargeFont.copyWith(
            color: context.colors.white,
            fontWeight: FontWeight.w600,
          ),
          onPressed: () => _onSubmitExpenseTap(context),
        ),
      ),
    );
  }

  void _onExpenseTap(BuildContext context, Expense expense) {
    // TODO: Navigate to expense detail screen
  }

  void _onSubmitExpenseTap(BuildContext context) {
    context.push(
      RouteNames.submitExpense,
      extra: context.read<ExpensesCubit>(),
    );
  }

  void _onDeleteTap(BuildContext context, Expense expense) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Delete Expense'),
        content: Text(
          'Are you sure you want to delete "${expense.title}"?\n'
              'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ExpensesCubit>().deleteExpense(expense);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: context.colors.error),
            ),
          ),
        ],
      ),
    );
  }
}