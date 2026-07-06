import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';


class TermsPopup extends StatelessWidget {
  final VoidCallback onAgree;

  const TermsPopup({super.key, required this.onAgree});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),

          Text(
            'terms_and_conditions_title'.tr(),
            textAlign: TextAlign.center,
            style: context.textTheme.titleLargeFontSemiBold.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.black,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Scrollbar(
                controller: scrollController,
                thickness: 6.0,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text(
                    'terms_and_conditions_desc'.tr(),
                    style: context.textTheme.labelMediumFont.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          CustomPrimaryButton.gradient(
            buttonText: 'i_agree'.tr(),
            borderRadius: 30,
            textStyle: context.textTheme.labelLargeFont,
            onPressed: () {
              Navigator.of(context).pop();
              onAgree();
            },
          ),

          const SizedBox(height: 20),

          CustomPrimaryButton.outlined(
            buttonText: 'decline'.tr(),
            height: 48,
            borderRadius: 30,
            borderColor: context.colors.purple900,
            foregroundColor: context.colors.purple900,
            textStyle: context.textTheme.labelLargeFont,
            onPressed: () => Navigator.of(context).pop(),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}