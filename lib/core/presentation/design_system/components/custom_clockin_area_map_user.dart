import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class CustomClockInAreaMapUser extends StatelessWidget {
  final String imageUrl;
  final Color? circularColor;
  final void Function()? onTap;

  const CustomClockInAreaMapUser({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.circularColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: context.colors.purple500, width: 3),
        ),
        child: ClipOval(
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
