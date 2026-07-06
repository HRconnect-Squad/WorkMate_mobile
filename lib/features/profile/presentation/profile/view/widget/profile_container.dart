import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class ProfileContainer extends StatelessWidget {
  final String title;
  final List<ProfileItem> profileItems;


  const ProfileContainer({
    super.key,
    required this.title,
    required this.profileItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: context.textTheme.labelSmallFont.copyWith(
            color: context.colors.gray700,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.gray50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 12,
            children: [
              for (int i = 0; i < profileItems.length; i++) ...[
              _ProfileItemWidget(item: profileItems[i]),
              ]
                ]
          ),
        ),
      ],
    );
  }
}



class ProfileItem {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool showArrow;
  final Color? iconColor;
  final Color? textColor;
  final Color? iconBackgroundColor;
  final bool isDanger;

  const ProfileItem({
    required this.title,
    required this.icon,
    this.onTap,
    this.showArrow = true,
    this.iconColor,
    this.textColor,
    this.iconBackgroundColor,
    this.isDanger = false,
  });

  factory ProfileItem.info({
    required String title,
    required IconData icon,
    Color? iconColor,
  }) {
    return ProfileItem(
      title: title,
      icon: icon,
      onTap: null,
      showArrow: false,
      iconColor: iconColor,
    );
  }

  factory ProfileItem.action({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    bool showArrow = true,
    Color? iconColor,
  }) {
    return ProfileItem(
      title: title,
      icon: icon,
      onTap: onTap,
      showArrow: showArrow,
      iconColor: iconColor,
    );
  }

  factory ProfileItem.danger({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ProfileItem(
      title: title,
      icon: icon,
      onTap: onTap,
      showArrow: false,
      iconColor: null,
      textColor: null,
      isDanger: true,
    );
  }
}


class _ProfileItemWidget extends StatelessWidget {
  final ProfileItem item;

  const _ProfileItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final isDanger = item.isDanger;

    final iconColor = item.iconColor ??
        (isDanger ? context.colors.error : context.colors.purple500);
    final textColor = item.textColor ??
        (isDanger ? context.colors.error : context.colors.textPrimary);
    final iconBgColor = item.iconBackgroundColor ??
        (isDanger
            ? context.colors.error.withOpacity(0.1)
            : context.colors.purple100);

    final content = Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            item.icon,
            size: 18,
            color: iconColor,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            item.title,
            style: context.textTheme.bodyMediumFont.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        if (item.showArrow)
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: context.colors.gray400,
          ),
      ],
    );

    if (item.onTap != null) {
      return GestureDetector(
        onTap: item.onTap,
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }
    return content;
  }
}
