import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/design_system/components/history_card.dart';
import '../../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../../domain/entity/expense.dart';
import '../../../../domain/entity/expense_category.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const ExpenseCard({super.key, required this.expense, this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: HistoryCard(
        onTap: onTap,
        historyCardModel: HistoryCardModel(
          id: expense.id.toString(),
          date: expense.expenseDate,
          headerIcon: Iconsax.receipt_2,
          headerIconColor: context.colors.purple500,
          infoItems: [
            InfoItem(label: 'type'.tr(), value: expense.category.displayName),
            InfoItem(label: 'total_expense'.tr(), value: '\$${expense.amount}'),
          ],
          statusCard: switch (expense.status) {
            ExpenseStatus.approved => StatusCard.approved,
            ExpenseStatus.rejected => StatusCard.rejected,
            ExpenseStatus.pending => null,
          },
          // TODO: populate once the API returns approver info
          dateAddedStatus: null,
          statusAddedByName: null,
          actions: expense.isPending && onDelete != null
              ? [HistoryCardAction(label: 'delete'.tr(), icon: Iconsax.trash, color: context.colors.error, onTap: onDelete!)]
              : const [],
        ),
      ),
    );
  }
}