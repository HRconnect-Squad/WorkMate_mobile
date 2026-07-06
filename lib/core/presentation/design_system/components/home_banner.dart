import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/helper/theme_extention.dart';

class HomeBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color? backgroundColor;
  final double? offsetRight;

  const HomeBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.backgroundColor,
    this.offsetRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 24),
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor ?? context.colors.purple500,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr(),
                  style: context.textTheme.headLineSmallFont.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.colors.white,
                  ),
                ),
                Text(
                  subtitle.tr(),
                  style: context.textTheme.labelLargeFont.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: context.colors.purple200,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(offsetRight ?? 0, 0),
            child: Image.asset(image, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
