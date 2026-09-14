import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/leave_summary_state.dart';

class LeaveSummaryCard extends StatelessWidget {
  final LeaveSummaryState state;
  const LeaveSummaryCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return SummaryCard(
      title: 'total_leave'.tr(),
      subtitle: 'period_full_year'.tr(args: [now.year.toString(), now.year.toString()]),
      cardMargin: const EdgeInsets.symmetric(horizontal: 12),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.08),
      backgroundColor: context.colors.white,
      cardPadding: const EdgeInsets.all(16),
      headerSpacing: 16,
      itemSpacing: 8,
      itemPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      itemBorderRadius: const BorderRadius.all(Radius.circular(12)),
      itemBackgroundColor: context.colors.gray50,
      itemBorderColor: Colors.transparent,
      items: [
        StateItemModel(
          label: 'available'.tr(),
          value: state.isLoadingBalance ? '-' : '${state.availableDays}',
          indicatorColor: context.colors.success500,
        ),
        StateItemModel(
          label: 'leave_used'.tr(),
          value: state.isLoadingBalance ? '-' : '${state.usedDays}',
          indicatorColor: context.colors.purple500,
        ),
      ],
    );
  }
}