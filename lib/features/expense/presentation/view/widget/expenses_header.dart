import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import 'expenses_summary_card.dart';

class ExpensesHeader extends StatelessWidget {
  const ExpensesHeader({super.key});

  static const double _heroHeight = 230;
  static const double _summaryCardOverlapOffset = 90;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              height: _heroHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colors.purple600,
                    context.colors.purple400,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 0,
                  top: 6,
                  bottom: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Expense Summary',
                          style: context.textTheme.headLineSmallFont
                              .copyWith(
                            color: context.colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Claim your expenses here.',
                          style: context.textTheme.bodyMediumFont.copyWith(
                            color: context.colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      AppAssets.expenseIllustration,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: _heroHeight - _summaryCardOverlapOffset,
              left: 0,
              right: 0,
              child: const ExpensesSummaryCard(),
            ),
          ],
        ),

        const SizedBox(height: _summaryCardOverlapOffset),
      ],
    );
  }
}