import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class CustomClockinAreaMapUser extends StatelessWidget {
  final String imageUrl;
  final Color? circularColor;
  final EdgeInsets? padding;
  final void Function()? onTap;

  const CustomClockinAreaMapUser({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.circularColor,
    this.padding = const EdgeInsets.all(83),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circularColor ?? context.colors.gray200,
        border: Border.all(color: context.colors.purple500),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: context.colors.purple500, width: 3),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: 56,
            height: 56,
            errorWidget: (context, url, error) =>
                ClipOval(child: Image.asset(AppAssets.profilePlaceholder)),
          ),
        ),
      ),
    );
  }
}
