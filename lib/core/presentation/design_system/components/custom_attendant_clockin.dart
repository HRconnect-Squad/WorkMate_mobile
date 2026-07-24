import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class CustomAttendantClockIn extends StatelessWidget {
  final String imageUrl;
  final String? title, dateTitle, locationTitle;

  const CustomAttendantClockIn({
    super.key,
    required this.imageUrl,
    this.title,
    this.dateTitle,
    this.locationTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.colors.gray200),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: 64,
                width: 64,
                errorWidget: (context, url, error) =>
                    Image.asset(AppAssets.kDefaultImageProfile),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    Text(
                      title ?? "username".tr(),
                      style: context.textTheme.bodyLargeFont.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Iconsax.verify5,
                      size: 16,
                      color: context.colors.purple500,
                    ),
                  ],
                ),
                Text(
                  dateTitle ?? "attendancedate".tr(),
                  style: context.textTheme.labelMediumFont.copyWith(
                    color: context.colors.purple500,
                  ),
                ),
                SizedBox(height: 9),
              ],
            ),
            subtitle: Row(
              spacing: 4,
              children: [
                Icon(
                  Iconsax.location_tick5,
                  size: 12,
                  color: context.colors.purple500,
                ),
                Text(
                  locationTitle ?? "locationlabel".tr(),
                  style: context.textTheme.bodySmallFont.copyWith(
                    color: context.colors.gray600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
