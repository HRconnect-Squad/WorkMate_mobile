import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../core/presentation/design_system/theme/helper/app_assets.dart';

class ExpensesSummaryCard extends StatelessWidget {
  const ExpensesSummaryCard({super.key});

  // TODO: Replace with real data from summary endpoint
  static const double _totalAmount = 1010;
  static const double _reviewAmount = 455;
  static const double _approvedAmount = 555;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentYear = now.year;

    return SummaryCard(
      title: 'Total Expense',
      subtitle: 'Period 1 Jan $currentYear - 31 Dec $currentYear',
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
          label: 'Total',
          value: '\$$_totalAmount',
          icon: SvgPicture.asset(AppAssets.wallet, width: 16, height: 16)),
        StateItemModel(
          label: 'Review',
          value: '\$$_reviewAmount',
          indicatorColor: context.colors.yellow500
        ),
        StateItemModel(
          label: 'Approved',
          value: '\$$_approvedAmount',
          indicatorColor: context.colors.success500
        ),
      ],
    );
  }
}