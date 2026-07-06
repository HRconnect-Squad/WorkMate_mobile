import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/payroll.dart';

class PayrollMonthCard extends StatelessWidget {
  final Payroll payroll;
  final VoidCallback? onTap;

  const PayrollMonthCard({
    super.key,
    required this.payroll,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SummaryCard(
        title: payroll.formattedYearMonth,
        subtitle: payroll.isPaid ? 'paid'.tr() : 'pending'.tr(),
        cardMargin: const EdgeInsets.only(bottom: 16),
        backgroundColor: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: context.colors.gray200.withOpacity(0.5),
        cardPadding: const EdgeInsets.all(16),
        titleTextStyle: context.textTheme.titleMediumFont.copyWith(
          color: context.colors.purple700,
          fontWeight: FontWeight.w600,
        ),
        subtitleTextStyle: context.textTheme.labelSmallFont.copyWith(
          color: payroll.isPaid
              ? context.colors.success25
              : context.colors.warning25,
          fontWeight: FontWeight.w600,
        ),
        items: [
          StateItemModel(
            label: 'total_hours'.tr(),
            value: payroll.formattedTotalHours,
          ),
          StateItemModel(
            label: 'received'.tr(),
            value: payroll.formattedNetSalary,
          ),
          StateItemModel(
            label: 'paid_on'.tr(),
            value: payroll.formattedPaidPeriod,
          ),
        ],
        itemValueTextStyle: context.textTheme.titleSmallFont.copyWith(
          color: context.colors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        itemLabelTextStyle: context.textTheme.bodySmallFont.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}