import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';

class CustomUserChatTile extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl, title, subtitle, timeMessage;
  final num messageCount;

  const CustomUserChatTile({
    super.key,
    this.onTap,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.messageCount,
    required this.timeMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.gray200)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: 52,
            width: 52,
            errorWidget: (context, url, error) => Image.asset(
              AppAssets.profilePlaceholder,
              fit: BoxFit.cover,
              height: 52,
              width: 52,
            ),
          ),
        ),
        title: Text(
          title,
          style: context.textTheme.titleMediumFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.gray500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              timeMessage,
              style: context.textTheme.bodySmallFont.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            if (messageCount > 0)
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ExtensionColors.okay,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  messageCount.toString(),
                  style: context.textTheme.bodySmallFont.copyWith(
                    color: context.colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
