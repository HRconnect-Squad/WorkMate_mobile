import 'package:flutter/material.dart';
import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../model/on_boarding.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Image.asset(item.image, fit: BoxFit.cover),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: context.textTheme.headLineSmallFont.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item.subTitle,
                textAlign: TextAlign.center,
                style: context.textTheme.popupBodyFont.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
