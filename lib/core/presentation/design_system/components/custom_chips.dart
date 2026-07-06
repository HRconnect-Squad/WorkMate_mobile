import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomChips extends StatelessWidget {
  final Color? color, iconColor;
  final IconData? icon;
  final String title;
  final String? image;
  final double? iconSize;
  final TextStyle? style;
  final BoxBorder? border;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding, margin;

  const CustomChips({
    super.key,
    this.color = Colors.indigo,
    required this.title,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.margin,
    this.borderRadius = const BorderRadius.all(Radius.circular(100)),
    this.style,
    this.border,
    this.gradient,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        border: border,
        borderRadius: borderRadius,
        color: color,
      ),
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null && image!.isNotEmpty)
            SvgPicture.asset(
              image!,
              width: iconSize,
              height: iconSize,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            )
          else if (icon != null)
            Icon(icon, size: iconSize, color: iconColor),
          Text(title, style: style),
        ],
      ),
    );
  }
}
