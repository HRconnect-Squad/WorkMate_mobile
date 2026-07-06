import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final bool isEnabled;
  final String? label;
  final bool isLabelEnabled;
  final double size;
  final double borderRadius;
  final TextStyle? labelStyle;
  final double spacing;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? checkColor;

  final Color? disabledBackgroundColor;
  final Color? disabledBorderColor;
  final Color? disabledShadowColor;
  final Color? disabledCheckColor;
  final double disabledOpacity;
  final void Function(bool)? onChanged;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    this.isEnabled = true,
    this.isLabelEnabled = true,
    this.label,
    this.size = 20,
    this.borderRadius = 4,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.checkColor,
    this.disabledBackgroundColor,
    this.disabledBorderColor,
    this.disabledShadowColor,
    this.disabledCheckColor,
    this.labelStyle,
    this.spacing = 8,
    this.disabledOpacity = 0.5,
    this.onChanged,
  });

  bool get _isInteractive => isEnabled && onChanged != null;

  @override
  Widget build(BuildContext context) {
    final themeColors = context.colors;
    final themeText = context.textTheme;

    final enabledBackgroundColors = backgroundColor ?? themeColors.purple50;
    final enabledBorderColors = this.borderColor ?? themeColors.primary;
    final enabledCheckColors = this.checkColor ?? themeColors.primary;
    final enabledShadowColors = this.shadowColor;

    final disabledBackgroundColors =
        disabledBackgroundColor ?? themeColors.white;
    final disabledBorderColors = disabledBorderColor ?? themeColors.gray300;
    final disabledCheckColors = disabledCheckColor ?? themeColors.gray300;
    final disabledShadowColors = disabledShadowColor;

    final effectiveBackgroundColor = isEnabled
        ? enabledBackgroundColors
        : disabledBackgroundColors;
    final effectiveBorderColor = isEnabled
        ? enabledBorderColors
        : disabledBorderColors;
    final effectiveCheckColor = isEnabled
        ? enabledCheckColors
        : disabledCheckColors;
    final effectiveShadowColor = isEnabled
        ? enabledShadowColors
        : disabledShadowColors;

    return Opacity(
      opacity: isEnabled ? 1.0 : disabledOpacity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _isInteractive ? () => onChanged!(!isChecked) : null,
            child: _buildCheckbox(
              activeColor: effectiveBackgroundColor,
              borderColor: effectiveBorderColor,
              checkColor: effectiveCheckColor,
              shadowColor: effectiveShadowColor,
            ),
          ),
          if (isLabelEnabled && label != null) ...[
            SizedBox(width: spacing),
            Text(
              label!,
              style:
                  labelStyle ??
                  themeText.labelMediumFont.copyWith(color: themeColors.black),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCheckbox({
    required Color activeColor,
    required Color borderColor,
    required Color checkColor,
    Color? shadowColor,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: size,
      height: size,

      decoration: BoxDecoration(
        color: activeColor,
        boxShadow: [
          if (shadowColor != null)
            BoxShadow(color: shadowColor.withAlpha(200), blurRadius: 4),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: isChecked ? 1.0 : 0.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(
            AppAssets.checkMark,
            width: size * 0.9,
            height: size * 0.9,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(checkColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
