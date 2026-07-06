import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../theme/helper/theme_extention.dart';

class StateItemModel {
  final String label;
  final String value;
  final Widget? icon;
  final Color? indicatorColor;

  const StateItemModel({
    required this.label,
    required this.value,
    this.icon,
    this.indicatorColor,
  });
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<StateItemModel> items;
  final double indicatorSize;

  final Color? backgroundColor;
  final BoxBorder? border;
  final Color? shadowColor;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final EdgeInsetsGeometry cardPadding;
  final EdgeInsetsGeometry? cardMargin;

  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  final TextStyle? itemLabelTextStyle;
  final TextStyle? itemValueTextStyle;
  final double itemSpacing;

  final EdgeInsetsGeometry itemPadding;
  final BorderRadiusGeometry itemBorderRadius;
  final Color? itemBackgroundColor;
  final Color? itemBorderColor;

  final double headerSpacing;

  // Whether items should expand equally
  final bool expandItems;

  final List<Widget>? buttons;

  const SummaryCard({
    super.key,
    required this.title,
    required this.items,
    this.buttons,
    this.subtitle,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.elevation = 0,
    this.cardPadding = const EdgeInsets.fromLTRB(16, 12, 16, 16),
    this.cardMargin,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.itemLabelTextStyle,
    this.itemValueTextStyle,
    this.itemSpacing = 12,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    this.itemBorderRadius = const BorderRadius.all(Radius.circular(8)),
    this.itemBackgroundColor,
    this.itemBorderColor,
    this.indicatorSize = 10,
    this.headerSpacing = 12,
    this.expandItems = true,
    this.border,
    this.shadowColor,
  });

  bool get _hasActions => buttons != null && buttons!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final themeColors = context.colors;

    return Container(
      margin: cardMargin,
      decoration: BoxDecoration(
        color: backgroundColor ?? themeColors.gray25,
        borderRadius: borderRadius,
        border: border,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: shadowColor ?? themeColors.gray50,
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            SizedBox(height: headerSpacing),
            _buildStatsRow(context),
            if (_hasActions) ...[
              SizedBox(height: headerSpacing),
              _buildActions(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        for (int i = 0; i < buttons!.length; i++)
          if (expandItems)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: i == buttons!.length - 1 ? 0 : itemSpacing,
                ),
                child: buttons![i],
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(
                right: i == buttons!.length - 1 ? 0 : itemSpacing,
              ),
              child: buttons![i],
            ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final themeColors = context.colors;
    final themeText = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              titleTextStyle ??
              themeText.titleSmallFont.copyWith(
                color: themeColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style:
                subtitleTextStyle ??
                themeText.bodySmallFont.copyWith(color: themeColors.gray500),
          ),
        ],
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < items.length; i++)
          if (expandItems)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: i == items.length - 1 ? 0 : itemSpacing,
                ),
                child: _buildStatItem(items[i], context),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(
                right: i == items.length - 1 ? 0 : itemSpacing,
              ),
              child: _buildStatItem(items[i], context),
            ),
      ],
    );
  }

  Widget _buildStatItem(StateItemModel item, BuildContext context) {
    return Container(
      padding: itemPadding,
      decoration: BoxDecoration(
        color: itemBackgroundColor ?? context.colors.cardBackground,
        borderRadius: itemBorderRadius,
        border: Border.all(
          color: itemBorderColor ?? context.colors.gray200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: item.icon,
                )
              else if (item.indicatorColor != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    width: indicatorSize,
                    height: indicatorSize,
                    decoration: BoxDecoration(
                      color: item.indicatorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              Flexible(
                child: Text(
                  item.label,
                  style:
                      itemLabelTextStyle ??
                      context.textTheme.labelMediumFont.copyWith(
                        color: context.colors.textSecondary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.value,
            style:
                itemValueTextStyle ??
                context.textTheme.titleLargeFont.copyWith(
                  color: context.colors.textPrimary,
                ),
          ),
        ],
      ),
    );
  }
}

@Preview(name: 'Summary Card')
Widget summaryCardPreview() {
  return const ElevatedButton(onPressed: null, child: Text('Click Me'));
}
