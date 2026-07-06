import 'package:flutter/material.dart';

import '../theme/helper/theme_extention.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? count;

  const CardHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: context.textTheme.titleLargeFontSemiBold.copyWith(
                fontSize: 14,
                color: context.colors.textPrimary,
              ),
            ),
            const SizedBox(width: 4),
            if (count != null)
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: context.colors.purple100,
                ),
                child: Center(
                  child: Text(
                    count!,
                    style: context.textTheme.titleLargeFontSemiBold.copyWith(
                      fontSize: 12,
                      color: context.colors.purple500,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Text(
          subtitle,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
