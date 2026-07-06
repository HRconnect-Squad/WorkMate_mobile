import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/components/expense_history_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../domain/entity/expense.dart';
import '../../../domain/entity/expense_category.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const ExpenseCard({
    super.key,
    required this.expense,
    this.onTap,
    this.onDelete,
  });

  ExpenseCardStatus get _cardStatus {
    return switch (expense.status) {
      ExpenseStatus.pending => ExpenseCardStatus.pending,
      ExpenseStatus.approved => ExpenseCardStatus.approved,
      ExpenseStatus.rejected => ExpenseCardStatus.rejected,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpenseHistoryCard(
        status: _cardStatus,
        type: expense.category.displayName,
        totalExpense: expense.amount,
        date: expense.expenseDate,
        approvedByName: null, // TODO: when API returns approver info
        approvedByImage: null,
        onTap: onTap,
        onDelete: expense.isPending ? onDelete : null,
      ),
    );
  }
}