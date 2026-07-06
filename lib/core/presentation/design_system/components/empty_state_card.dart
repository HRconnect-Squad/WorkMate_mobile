import 'package:flutter/material.dart';

import '../theme/helper/theme_extention.dart';

class EmptyStateCard extends StatelessWidget {
  final String imgPath;
  final String imgtitle;
  final String imgDescription;

  const EmptyStateCard({
    super.key,
    required this.imgPath,
    required this.imgtitle,
    required this.imgDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset(
              imgPath,
              height: 126,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                imgtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleSmallFont.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                imgDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelSmallFont.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colors.gray300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
