import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? actionsPadding;
  final Widget? leading;
  final Widget? titleWidget;
  final double? leadingWidth;
  final Color? leadingBackgroundColor;
  final Color? leadingIconColor;
  final Color? actionBackgroundColor;
  final Color? actionIconColor;

  final String? profileName;
  final String? profileJobTitle;
  final String? profileAvatarUrl;
  final VoidCallback? onChatPressed;
  final VoidCallback? onBellPressed;
  final VoidCallback? onProfilePressed;
  final bool isVerified;
  final bool safeArea;


  const CustomAppBar({
    super.key,

    this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,

    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.elevation,
    this.padding,
    this.leading,
    this.titleWidget,
    this.leadingWidth,
    this.leadingBackgroundColor,
    this.leadingIconColor,
    this.actionsPadding,
    this.actionBackgroundColor,
    this.actionIconColor,

    this.profileName,
    this.profileJobTitle,
    this.profileAvatarUrl,
    this.onChatPressed,
    this.onBellPressed,
    this.onProfilePressed,
    this.isVerified = false,
    this.safeArea = false,
  });

  factory CustomAppBar.simple({
    required String title,
    bool showBackButton = true,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? leadingBackgroundColor,
    Color? leadingIconColor,
  }) {
    return CustomAppBar(
      title: title,
      showBackButton: showBackButton,
      onBackPressed: onBackPressed,
      actions: actions,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      centerTitle: true,
      leadingBackgroundColor: leadingBackgroundColor,
      leadingIconColor: leadingIconColor,
    );
  }

  factory CustomAppBar.profile({
    required String profileName,
    required String profileJobTitle,
    String? profileAvatarUrl,
    VoidCallback? onChatPressed,
    VoidCallback? onBellPressed,
    Color? actionBackgroundColor,
    Color? actionIconColor,
    Color? backgroundColor,
    bool isVerified = false,
    Color? foregroundColor,
    bool showBackButton = false,
    bool safeArea = false,
    VoidCallback? onProfilePressed,
  }) {
    return CustomAppBar(
      profileName: profileName,
      profileJobTitle: profileJobTitle,
      profileAvatarUrl: profileAvatarUrl,
      onChatPressed: onChatPressed,
      onBellPressed: onBellPressed,
      backgroundColor: backgroundColor,
      actionBackgroundColor: actionBackgroundColor,
      actionIconColor: actionIconColor,
      centerTitle: false,
      foregroundColor: foregroundColor,
      showBackButton: showBackButton,
      isVerified: isVerified,
      safeArea: safeArea,
      onProfilePressed: onProfilePressed,
    );
  }

  bool get isProfileMode => profileName != null;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBackgroundColor = backgroundColor ?? colors.surface;
    final effectiveForegroundColor = foregroundColor ?? colors.textPrimary;

    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      //color: effectiveBackgroundColor,
      child:
      safeArea ?
      SafeArea(child: _buildAppBar(context, effectiveBackgroundColor, effectiveForegroundColor))
          : _buildAppBar(context, effectiveBackgroundColor, effectiveForegroundColor)
    );
  }

  Widget _buildAppBar(BuildContext context, Color backgroundColor, Color foregroundColor) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation ?? 0,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: false,
      actionsPadding: actionsPadding ?? const EdgeInsets.symmetric(horizontal: 12),
      leading: leading ?? _buildLeading(context),
      title: titleWidget ?? _buildTitle(context, foregroundColor),
      actions: actions ?? _buildActions(context, foregroundColor),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (showBackButton && !isProfileMode) {
      return IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 16,
          color: leadingIconColor ?? context.colors.primary,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        style: IconButton.styleFrom(
          backgroundColor: leadingBackgroundColor ?? context.colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8),
        ),
      );
    }
    return null;
  }

  Widget? _buildTitle(BuildContext context, Color foregroundColor) {
    if (isProfileMode) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileAvatar(),
          const SizedBox(width: 8),
          _buildProfileInfo(context, foregroundColor),
        ],
      );
    }

    if (title != null) {
      return Text(
        title!,
        style: context.textTheme.popupTitleFont.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return null;
  }

  Widget _buildProfileAvatar() {
    return GestureDetector(
      onTap: onProfilePressed,
      child: CircleAvatar(
        radius: 20,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: profileAvatarUrl ?? '',
            fit: BoxFit.cover,
            width: 44,
            height: 44,
            placeholder: (context, url) =>
                Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
            errorWidget: (context, url, error) =>
                Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context, Color foregroundColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              profileName ?? "Username".tr(),
              style: context.textTheme.titleMediumFont.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isVerified) ...[
              const SizedBox(width: 8),
              Icon(Icons.verified, color: context.colors.primary, size: 20),
            ],
          ],
        ),
        Text(
          profileJobTitle ?? "job_title".tr(),
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }

  List<Widget>? _buildActions(BuildContext context, Color foregroundColor) {
    if (!isProfileMode) return null;

    return [
      _buildActionButton(
        icon: Icons.message_rounded,
        onPressed: onChatPressed,
        backgroundColor: actionBackgroundColor ?? context.colors.purple100,
        iconColor: actionIconColor ?? context.colors.primary,
      ),
      const SizedBox(width: 8),
      _buildActionButton(
        icon: Icons.notifications_rounded,
        onPressed: onBellPressed,
        backgroundColor: context.colors.purple100,
        iconColor: context.colors.primary,
      ),
    ];
  }

  Widget _buildActionButton({
    required IconData icon,
    VoidCallback? onPressed,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: iconColor),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
