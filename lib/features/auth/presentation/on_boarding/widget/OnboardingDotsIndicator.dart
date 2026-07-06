import 'package:flutter/material.dart';

import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const OnboardingDotsIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(itemCount, (index) {
          return Container(
            margin: const EdgeInsetsDirectional.only(end: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: currentIndex == index
                  ? context.colors.purple500
                  : context.colors.purple100,
            ),
            height: 4,
            width: 20,
          );
        }),
      ],
    );
  }
}