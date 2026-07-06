import 'package:flutter/material.dart';
import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../domain/entity/expense_category.dart';

class ExpensesTabFilter extends StatelessWidget {
  final ExpenseStatus selectedStatus;
  final int pendingCount;
  final int approvedCount;
  final int rejectedCount;
  final ValueChanged<ExpenseStatus> onTabChanged;

  const ExpensesTabFilter({
    super.key,
    required this.selectedStatus,
    required this.pendingCount,
    required this.approvedCount,
    required this.rejectedCount,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 38,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: context.colors.cardBackgroundSecondary,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _TabItem(
            label: 'Review',
            count: pendingCount,
            isActive: selectedStatus == ExpenseStatus.pending,
            onTap: () => onTabChanged(ExpenseStatus.pending),
          ),
          _TabItem(
            label: 'Approved',
            count: approvedCount,
            isActive: selectedStatus == ExpenseStatus.approved,
            onTap: () => onTabChanged(ExpenseStatus.approved),
          ),
          _TabItem(
            label: 'Rejected',
            count: rejectedCount,
            isActive: selectedStatus == ExpenseStatus.rejected,
            onTap: () => onTabChanged(ExpenseStatus.rejected),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final int count;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isActive ? context.colors.purple500 : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                label,
                style: context.textTheme.labelSmallFont.copyWith(
                  color: isActive
                      ? context.colors.white
                      : context.colors.textSecondary,
                  fontWeight:FontWeight.w600,
                  fontSize: 12
                ),
              ),

              if (count > 0) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isActive
                        ? context.colors.error500
                        : context.colors.gray300,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    count >= 10 ? '+9' : '$count',
                    style: context.textTheme.labelSmallFont.copyWith(
                      color: isActive
                          ? context.colors.white
                          : context.colors.textSecondary,
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
