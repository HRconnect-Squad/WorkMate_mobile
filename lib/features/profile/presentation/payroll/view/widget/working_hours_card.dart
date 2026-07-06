import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/payroll.dart';

class WorkingHoursCard extends StatelessWidget {
  final Payroll payroll;

  const WorkingHoursCard({
    super.key,
    required this.payroll,
  });

  @override
  Widget build(BuildContext context) {
    return SummaryCard(
      title: 'total_working_hour'.tr(),
      subtitle: '${'paid_period'.tr()} ${payroll.formattedPaidPeriod}',
      backgroundColor: context.colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: context.colors.gray200.withOpacity(0.5),
      cardPadding: const EdgeInsets.all(16),
      itemBackgroundColor: context.colors.purple50,
      itemBorderColor: Colors.transparent,
      itemPadding: const EdgeInsets.all(12),
      itemBorderRadius: BorderRadius.circular(12),
      items: [
        if (payroll.presentDays != null && payroll.workingDays != null)
          StateItemModel(
            label: 'attendance'.tr(),
            value: '${payroll.presentDays}/${payroll.workingDays} ${'days'.tr()}',
            icon: _buildIcon(context, Iconsax.calendar),
          ),
        StateItemModel(
          label: 'this_pay_period'.tr(),
          value: payroll.formattedTotalHours,
          icon: _buildIcon(context, Iconsax.timer_1),
        ),
      ],
      itemValueTextStyle: context.textTheme.titleSmallFont.copyWith(
        color: context.colors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      itemLabelTextStyle: context.textTheme.bodySmallFont.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: context.colors.purple100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: context.colors.purple500,
        size: 14,
      ),
    );
  }
}