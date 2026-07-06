import 'package:flutter/material.dart';

import '../theme/helper/theme_extention.dart';

enum ButtonType { filled, outlined, text, gradient }

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;

  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;

  final double elevation;
  final Color? shadowColor;

  final Widget? icon;
  final double iconSpacing;

  final bool isLoading;
  final bool isEnabled;
  final bool showTextDuringLoading;

  final ButtonType buttonType;

  final Gradient? gradient;
  final Gradient? disabledGradient;

  const CustomPrimaryButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderColor,
    this.borderWidth = 1.5,
    this.borderRadius = 100,
    this.elevation = 0,
    this.shadowColor,
    this.icon,
    this.iconSpacing = 8,
    this.isLoading = false,
    this.isEnabled = true,
    this.showTextDuringLoading = true,
    this.textStyle,
    this.buttonType = ButtonType.filled,
    this.gradient,
    this.disabledGradient,
  });

  factory CustomPrimaryButton.filled({
    required String buttonText,
    VoidCallback? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 14,
    ),
    Color? backgroundColor,
    Color? foregroundColor,
    double borderRadius = 100,
    double elevation = 0,
    Widget? icon,
    double iconSpacing = 8,
    bool isLoading = false,
    bool isEnabled = true,
    bool showTextDuringLoading = true,
    TextStyle? textStyle,
  }) {
    return CustomPrimaryButton(
      buttonText: buttonText,
      onPressed: onPressed,
      width: width,
      height: height,
      padding: padding,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      elevation: elevation,
      icon: icon,
      iconSpacing: iconSpacing,
      isLoading: isLoading,
      isEnabled: isEnabled,
      showTextDuringLoading: showTextDuringLoading,
      textStyle: textStyle,
      buttonType: ButtonType.filled,
    );
  }

  factory CustomPrimaryButton.outlined({
    required String buttonText,
    VoidCallback? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 14,
    ),
    Color? borderColor,
    Color? foregroundColor,
    double borderWidth = 1.5,
    double borderRadius = 100,
    Widget? icon,
    double iconSpacing = 8,
    bool isLoading = false,
    bool isEnabled = true,
    bool showTextDuringLoading = true,
    TextStyle? textStyle,
  }) {
    return CustomPrimaryButton(
      buttonText: buttonText,
      onPressed: onPressed,
      width: width,
      height: height,
      padding: padding,
      borderColor: borderColor,
      foregroundColor: foregroundColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      icon: icon,
      iconSpacing: iconSpacing,
      isLoading: isLoading,
      isEnabled: isEnabled,
      showTextDuringLoading: showTextDuringLoading,
      textStyle: textStyle,
      buttonType: ButtonType.outlined,
    );
  }

  factory CustomPrimaryButton.text({
    required String buttonText,
    VoidCallback? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    Color? foregroundColor,
    double borderRadius = 100,
    Widget? icon,
    double iconSpacing = 8,
    bool isLoading = false,
    bool isEnabled = true,
    bool showTextDuringLoading = true,
    TextStyle? textStyle,
  }) {
    return CustomPrimaryButton(
      buttonText: buttonText,
      onPressed: onPressed,
      width: width,
      height: height,
      padding: padding,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      icon: icon,
      iconSpacing: iconSpacing,
      isLoading: isLoading,
      isEnabled: isEnabled,
      showTextDuringLoading: showTextDuringLoading,
      textStyle: textStyle,
      buttonType: ButtonType.text,
    );
  }

  factory CustomPrimaryButton.gradient({
    required String buttonText,
    Gradient? gradient,
    VoidCallback? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 14,
    ),
    Color? foregroundColor,
    Gradient? disabledGradient,
    double borderRadius = 100,
    double elevation = 0,
    Color? shadowColor,
    Widget? icon,
    double iconSpacing = 8,
    bool isLoading = false,
    bool isEnabled = true,
    bool showTextDuringLoading = true,
    TextStyle? textStyle,
  }) {
    return CustomPrimaryButton(
      buttonText: buttonText,
      onPressed: onPressed,
      width: width,
      height: height,
      padding: padding,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      elevation: elevation,
      shadowColor: shadowColor,
      icon: icon,
      iconSpacing: iconSpacing,
      isLoading: isLoading,
      isEnabled: isEnabled,
      showTextDuringLoading: showTextDuringLoading,
      textStyle: textStyle,
      buttonType: ButtonType.gradient,
      gradient: gradient,
      disabledGradient: disabledGradient,
    );
  }

  bool get _isInteractive => isEnabled && !isLoading && onPressed != null;

  @override
  Widget build(BuildContext context) {
    final Widget button;

    switch (buttonType) {
      case ButtonType.filled:
        button = _buildFilledButton(context);
        break;
      case ButtonType.outlined:
        button = _buildOutlinedButton(context);
        break;
      case ButtonType.text:
        button = _buildTextButton(context);
        break;
      case ButtonType.gradient:
        button = _buildGradientButton(context);
        break;
    }

    return SizedBox(
      width: width ?? (buttonType == ButtonType.text ? null : double.infinity),
      height: height,
      child: button,
    );
  }

  Widget _buildFilledButton(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? context.colors.primary;
    final effectiveForegroundColor = foregroundColor ?? context.colors.white;
    final effectiveDisabledBgColor =
        disabledBackgroundColor ?? context.colors.gray300;
    final effectiveDisabledFgColor =
        disabledForegroundColor ?? context.colors.gray500;

    return ElevatedButton(
      onPressed: _isInteractive ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        disabledBackgroundColor: isLoading
            ? effectiveBackgroundColor
            : effectiveDisabledBgColor,
        disabledForegroundColor: isLoading
            ? effectiveForegroundColor
            : effectiveDisabledFgColor,
        elevation: elevation,
        shadowColor: shadowColor ?? Colors.transparent,
        surfaceTintColor: Colors.transparent,
        padding: padding,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: _buildContent(effectiveForegroundColor),
    );
  }

  Widget _buildOutlinedButton(BuildContext context) {
    final effectiveBorderColor = borderColor ?? context.colors.primary;
    final effectiveForegroundColor = foregroundColor ?? context.colors.primary;
    final effectiveDisabledFgColor =
        disabledForegroundColor ?? context.colors.gray400;

    return OutlinedButton(
      onPressed: _isInteractive ? onPressed : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: effectiveForegroundColor,
        disabledForegroundColor: isLoading
            ? effectiveForegroundColor
            : effectiveDisabledFgColor,
        side: BorderSide(
          color: _isInteractive || isLoading
              ? effectiveBorderColor
              : context.colors.gray300,
          width: borderWidth,
        ),
        padding: padding,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: _buildContent(effectiveForegroundColor),
    );
  }

  Widget _buildTextButton(BuildContext context) {
    final effectiveForegroundColor = foregroundColor ?? context.colors.primary;
    final effectiveDisabledFgColor =
        disabledForegroundColor ?? context.colors.gray400;

    return TextButton(
      onPressed: _isInteractive ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: effectiveForegroundColor,
        disabledForegroundColor: isLoading
            ? effectiveForegroundColor
            : effectiveDisabledFgColor,
        padding: padding,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: _buildContent(effectiveForegroundColor),
    );
  }

  Widget _buildGradientButton(BuildContext context) {
    final effectiveForegroundColor = foregroundColor ?? context.colors.white;

    final defaultGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.29, 1.0],
      colors: [
        context.colors.purple500,
        context.colors.purple600,
        context.colors.purple700,
      ],
    );
    final effectiveDisabledGradient =
        disabledGradient ??
        LinearGradient(
          colors: [context.colors.gray300, context.colors.gray400],
        );

    final isDisabledState = !isEnabled && !isLoading;
    final effectiveGradient = isDisabledState
        ? effectiveDisabledGradient
        : (gradient ?? defaultGradient);

    return Opacity(
      opacity: isDisabledState ? 0.6 : 1.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: effectiveGradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: elevation > 0
              ? [
                  BoxShadow(
                    color: shadowColor ?? Colors.black.withAlpha(100),
                    blurRadius: elevation * 2,
                    offset: Offset(0, elevation),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _isInteractive ? onPressed : null,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Padding(
              padding: padding,
              child: Center(child: _buildContent(effectiveForegroundColor)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Color foregroundColor) {
    if (isLoading) {
      return _buildLoadingContent(foregroundColor);
    }
    return _buildNormalContent(foregroundColor);
  }

  Widget _buildNormalContent(Color foregroundColor) {
    final effectiveTextStyle =
        textStyle?.copyWith(color: textStyle?.color ?? foregroundColor) ??
        TextStyle(color: foregroundColor);

    if (icon == null) {
      return Text(
        buttonText,
        style: effectiveTextStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon!,
        SizedBox(width: iconSpacing),
        Flexible(
          child: Text(
            buttonText,
            style: effectiveTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingContent(Color foregroundColor) {
    final effectiveTextStyle =
        textStyle?.copyWith(color: textStyle?.color ?? foregroundColor) ??
        TextStyle(color: foregroundColor);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
          ),
        ),
        if (showTextDuringLoading) ...[
          SizedBox(width: iconSpacing),
          Flexible(
            child: Text(
              buttonText,
              style: effectiveTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}
