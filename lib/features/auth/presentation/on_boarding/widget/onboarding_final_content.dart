import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class OnboardingFinalContent extends StatelessWidget {
  const OnboardingFinalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            AppAssets.kOnBoargingFinal,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'onboarding_final_title'.tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.headLineSmallFont.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'onboarding_final_subtitle'.tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.popupBodyFont.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}