import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/leave_status.dart';

class LeaveTabFilter extends StatelessWidget {
  final LeaveStatus selectedStatus;
  final int pendingCount;
  final int rejectedCount;
  final ValueChanged<LeaveStatus> onTabChanged;

  const LeaveTabFilter({
    super.key,
    required this.selectedStatus,
    this.pendingCount = 0,
    this.rejectedCount = 0,
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          _tab(context, LeaveStatus.pending, 'pending'.tr(), pendingCount),
          _tab(context, LeaveStatus.approved, 'approved'.tr(), 0),
          _tab(context, LeaveStatus.rejected, 'rejected'.tr(), rejectedCount),
        ],
      ),
    );
  }

  Widget _tab(BuildContext context, LeaveStatus status, String label, int count) {
    final isActive = selectedStatus == status;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(status),
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
                  color: isActive ? context.colors.white : context.colors.textSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              if (count > 0) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isActive ? context.colors.error500 : context.colors.gray300,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    count >= 10 ? '+9' : '$count',
                    style: context.textTheme.labelSmallFont
                        .copyWith(color: isActive ? context.colors.white : context.colors.textSecondary, fontSize: 10),
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