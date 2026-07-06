import 'package:flutter/material.dart';

import 'app_constant_text.dart';

@immutable
class WorkMateTextStyle extends ThemeExtension<WorkMateTextStyle> {
  static const _fontFamily = 'Inter';
  final TextStyle displayLargeFont;
  final TextStyle displayMediumFont;
  final TextStyle displaySmallFont;

  final TextStyle titleLargeFont;
  final TextStyle titleLargeFontSemiBold;
  final TextStyle titleMediumFont;
  final TextStyle titleSmallFont;

  final TextStyle headLineLargeFont;
  final TextStyle headLineMediumFont;
  final TextStyle headLineSmallFont;

  final TextStyle bodyLargeFont;
  final TextStyle bodyMediumFont;
  final TextStyle bodySmallFont;

  final TextStyle labelLargeFont;
  final TextStyle labelMediumFont;
  final TextStyle labelSmallFont;

  final TextStyle popupTitleFont;
  final TextStyle popupBodyFont;

  final TextStyle navbarTitleFont;

  const WorkMateTextStyle({
    required this.displayLargeFont,
    required this.displayMediumFont,
    required this.displaySmallFont,
    required this.titleLargeFont,
    required this.titleLargeFontSemiBold,
    required this.titleMediumFont,
    required this.titleSmallFont,
    required this.headLineLargeFont,
    required this.headLineMediumFont,
    required this.headLineSmallFont,
    required this.bodyLargeFont,
    required this.bodyMediumFont,
    required this.bodySmallFont,
    required this.labelLargeFont,
    required this.labelMediumFont,
    required this.labelSmallFont,
    required this.popupTitleFont,
    required this.popupBodyFont,
    required this.navbarTitleFont,
  });

  static const workMateTextStyle = WorkMateTextStyle(
    // ============ DISPLAY ============
    displayLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize57,
      height: 64 / 57,
      letterSpacing: -0.25,
      fontWeight: FontWeight.w400,
    ),
    displayMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize45,
      height: 52 / 45,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    displaySmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize36,
      height: 44 / 36,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),

    // ============ HEADLINE ============
    headLineLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize32,
      height: 40 / 32,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    headLineMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize28,
      height: 36 / 28,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    headLineSmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize24,
      height: 32 / 24,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),

    // ============ TITLE ============
    titleLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    titleLargeFontSemiBold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    titleMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize16,
      height: 24 / 16,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w500,
    ),
    titleSmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      height: 20 / 14,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
    ),

    // ============ BODY ============
    bodyLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize16,
      height: 24 / 16,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
    ),
    bodyMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      height: 20 / 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w400,
    ),
    bodySmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize12,
      height: 16 / 12,
      letterSpacing: -0.2,
      fontWeight: FontWeight.w400,
    ),

    // ============ LABEL ============
    labelLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      height: 20 / 14,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
    ),
    labelMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize12,
      height: 16 / 12,
      letterSpacing: -0.5,
      fontWeight: FontWeight.w500,
    ),
    labelSmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize11,
      height: 16 / 11,
      letterSpacing: -0.15,
      fontWeight: FontWeight.w500,
    ),

    // ============ Popup ============
    popupTitleFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize20,
      fontWeight: FontWeight.w600,
    ),
    popupBodyFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize13,
      fontWeight: FontWeight.w500,
    ),

    // ============ Navbar ============
    navbarTitleFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize18,
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  ThemeExtension<WorkMateTextStyle> copyWith({
    TextStyle? displayLargeFont,
    TextStyle? displayMediumFont,
    TextStyle? displaySmallFont,
    TextStyle? titleLargeFont,
    TextStyle? titleLargeFontSemiBold,
    TextStyle? titleMediumFont,
    TextStyle? titleSmallFont,
    TextStyle? headLineLargeFont,
    TextStyle? headLineMediumFont,
    TextStyle? headLineSmallFont,
    TextStyle? bodyLargeFont,
    TextStyle? bodyMediumFont,
    TextStyle? bodySmallFont,
    TextStyle? labelLargeFont,
    TextStyle? labelMediumFont,
    TextStyle? labelSmallFont,
    TextStyle? popupTitleFont,
    TextStyle? popupBodyFont,
    TextStyle? navbarTitleFont,
  }) {
    return WorkMateTextStyle(
      displayLargeFont: displayLargeFont ?? this.displayLargeFont,
      displayMediumFont: displayMediumFont ?? this.displayMediumFont,
      displaySmallFont: displaySmallFont ?? this.displaySmallFont,
      titleLargeFont: titleLargeFont ?? this.titleLargeFont,
      titleLargeFontSemiBold:
          titleLargeFontSemiBold ?? this.titleLargeFontSemiBold,
      titleMediumFont: titleMediumFont ?? this.titleMediumFont,
      titleSmallFont: titleSmallFont ?? this.titleSmallFont,
      headLineLargeFont: headLineLargeFont ?? this.headLineLargeFont,
      headLineMediumFont: headLineMediumFont ?? this.headLineMediumFont,
      headLineSmallFont: headLineSmallFont ?? this.headLineSmallFont,
      bodyLargeFont: bodyLargeFont ?? this.bodyLargeFont,
      bodyMediumFont: bodyMediumFont ?? this.bodyMediumFont,
      bodySmallFont: bodySmallFont ?? this.bodySmallFont,
      labelLargeFont: labelLargeFont ?? this.labelLargeFont,
      labelMediumFont: labelMediumFont ?? this.labelMediumFont,
      labelSmallFont: labelSmallFont ?? this.labelSmallFont,
      popupTitleFont: popupTitleFont ?? this.popupTitleFont,
      popupBodyFont: popupBodyFont ?? this.popupBodyFont,
      navbarTitleFont: navbarTitleFont ?? this.navbarTitleFont,
    );
  }

  @override
  ThemeExtension<WorkMateTextStyle> lerp(
    covariant ThemeExtension<WorkMateTextStyle>? other,
    double t,
  ) {
    if (other is! WorkMateTextStyle) return this;
    return WorkMateTextStyle(
      displayLargeFont: TextStyle.lerp(displayLargeFont, other.displayLargeFont, t,)!,
      displayMediumFont: TextStyle.lerp(displayMediumFont, other.displayMediumFont, t,)!,
      displaySmallFont: TextStyle.lerp(displaySmallFont, other.displaySmallFont, t,)!,
      titleLargeFont: TextStyle.lerp(titleLargeFont, other.titleLargeFont, t)!,
      titleLargeFontSemiBold: TextStyle.lerp(titleLargeFontSemiBold, other.titleLargeFontSemiBold, t,)!,
      titleMediumFont: TextStyle.lerp(titleMediumFont, other.titleMediumFont, t,)!,
      titleSmallFont: TextStyle.lerp(titleSmallFont, other.titleSmallFont, t)!,
      headLineLargeFont: TextStyle.lerp(headLineLargeFont, other.headLineLargeFont, t,)!,
      headLineMediumFont: TextStyle.lerp(headLineMediumFont, other.headLineMediumFont, t,)!,
      headLineSmallFont: TextStyle.lerp(headLineSmallFont, other.headLineSmallFont, t,)!,
      bodyLargeFont: TextStyle.lerp(bodyLargeFont, other.bodyLargeFont, t)!,
      bodyMediumFont: TextStyle.lerp(bodyMediumFont, other.bodyMediumFont, t)!,
      bodySmallFont: TextStyle.lerp(bodySmallFont, other.bodySmallFont, t)!,
      labelLargeFont: TextStyle.lerp(labelLargeFont, other.labelLargeFont, t)!,
      labelMediumFont: TextStyle.lerp(labelMediumFont, other.labelMediumFont, t,)!,
      labelSmallFont: TextStyle.lerp(labelSmallFont, other.labelSmallFont, t)!,
      popupTitleFont: TextStyle.lerp(popupTitleFont, other.popupTitleFont, t)!,
      popupBodyFont: TextStyle.lerp(popupBodyFont, other.popupBodyFont, t)!,
      navbarTitleFont: TextStyle.lerp(navbarTitleFont, other.navbarTitleFont, t,)!,

    );
  }
}
