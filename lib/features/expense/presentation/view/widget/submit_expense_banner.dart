import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class SubmitExpenseBanner extends StatelessWidget {
  const SubmitExpenseBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsGeometry.directional(top: 20,start: 8,end: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colors.purple500,
            context.colors.purple400,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ensure All Document Well Prepared',
            style: context.textTheme.titleSmallFont.copyWith(
              color: context.colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '1000+ Expenses already approved',
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.white.withOpacity(0.85),
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Image.asset(
              AppAssets.submitExpenseIllustration,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}