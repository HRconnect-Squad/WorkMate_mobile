import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/helper/theme_extention.dart';

class HeaderBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color? backgroundColor;
  final double? paddingRight;

  const HeaderBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.backgroundColor,
    this.paddingRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 28, right: paddingRight ?? 0, top: 24),
      height: 190,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
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
                    color: context.colors.white,
                  ),
                ),
                Text(
                  subtitle.tr(),
                  style: context.textTheme.labelLargeFont.copyWith(
                    color: context.colors.purple200,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Image.asset(image, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
