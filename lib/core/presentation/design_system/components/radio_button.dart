import 'package:flutter/material.dart';
import '../theme/helper/theme_extention.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final bool isEnabled;
  final String? label;
  final bool isLabelEnabled;
  final double size;
  final TextStyle? labelStyle;
  final double spacing;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? dotColor;

  final Color? disabledBackgroundColor;
  final Color? disabledBorderColor;
  final Color? disabledShadowColor;
  final Color? disabledDotColor;

  final double disabledOpacity;
  final void Function(T)? onChanged;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    this.isEnabled = true,
    this.isLabelEnabled = true,
    this.label,
    this.size = 20,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.dotColor,
    this.disabledBackgroundColor,
    this.disabledBorderColor,
    this.disabledShadowColor,
    this.disabledDotColor,
    this.labelStyle,
    this.spacing = 8,
    this.disabledOpacity = 0.5,
    this.onChanged,
  });

  bool get _isSelected => value == groupValue;

  bool get _isInteractive => isEnabled && onChanged != null;

  @override
  Widget build(BuildContext context) {
    final themeColors = context.colors;
    final themeText = context.textTheme;

    final enabledBgColor = backgroundColor ?? themeColors.purple50;
    final enabledBorderColor = borderColor ?? themeColors.primary;
    final enabledShadowColor = shadowColor;
    final enabledDotColor = dotColor ?? themeColors.primary;

    final disabledBgColor = disabledBackgroundColor ?? themeColors.white;
    final disabledBorder = disabledBorderColor ?? themeColors.gray300;
    final disabledShadow = disabledShadowColor;
    final disabledDot = disabledDotColor ?? themeColors.gray300;

    final effectiveBgColor = isEnabled ? enabledBgColor : disabledBgColor;
    final effectiveBorderColor = isEnabled
        ? enabledBorderColor
        : disabledBorder;
    final effectiveShadowColor = isEnabled
        ? enabledShadowColor
        : disabledShadow;
    final effectiveDotColor = isEnabled ? enabledDotColor : disabledDot;

    return Opacity(
      opacity: isEnabled ? 1.0 : disabledOpacity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _isInteractive ? () => onChanged!(value) : null,
            child: _buildRadioButton(
              bgColor: effectiveBgColor,
              borderColor: effectiveBorderColor,
              dotColor: effectiveDotColor,
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

  Widget _buildRadioButton({
    required Color bgColor,
    required Color borderColor,
    required Color dotColor,
    Color? shadowColor,
  }) {
    final double dotSize = size * 0.5;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [
          if (shadowColor != null)
            BoxShadow(color: shadowColor.withAlpha(200), blurRadius: 4),
        ],
      ),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: _isSelected ? dotSize : 0,
          height: _isSelected ? dotSize : 0,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
