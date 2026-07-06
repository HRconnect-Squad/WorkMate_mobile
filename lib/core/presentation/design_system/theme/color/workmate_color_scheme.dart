import 'package:flutter/material.dart';

import 'app_constant_colors.dart';

@immutable
class WorkMateColorScheme extends ThemeExtension<WorkMateColorScheme> {
  // ============== Gray Palette ==============
  final Color gray25;
  final Color gray50;
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;
  final Color gray700;
  final Color gray800;
  final Color gray900;

  // ============== Purple Palette (Primary) ==============
  final Color purple25;
  final Color purple50;
  final Color purple100;
  final Color purple200;
  final Color purple300;
  final Color purple400;
  final Color purple500;
  final Color purple600;
  final Color purple700;
  final Color purple800;
  final Color purple900;

  // ============== Success Palette ==============
  final Color success25;
  final Color success50;
  final Color success100;
  final Color success200;
  final Color success300;
  final Color success400;
  final Color success500;
  final Color success600;
  final Color success700;
  final Color success800;
  final Color success900;

  // ============== Error Palette ==============
  final Color error25;
  final Color error50;
  final Color error100;
  final Color error200;
  final Color error300;
  final Color error400;
  final Color error500;
  final Color error600;
  final Color error700;
  final Color error800;
  final Color error900;

  // ============== Warning Palette ==============
  final Color warning25;
  final Color warning50;
  final Color warning100;
  final Color warning200;
  final Color warning300;
  final Color warning400;
  final Color warning500;
  final Color warning600;
  final Color warning700;
  final Color warning800;
  final Color warning900;

  // ============== Yellow Palette ==============
  final Color yellow25;
  final Color yellow50;
  final Color yellow100;
  final Color yellow200;
  final Color yellow300;
  final Color yellow400;
  final Color yellow500;
  final Color yellow600;
  final Color yellow700;
  final Color yellow800;
  final Color yellow900;

  // ============== Base Colors ==============
  final Color black;
  final Color white;
  final Color pureWhite;
  final Color offWhite;
  final Color baseWhite;

  // ============== Primary ==============
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;

  // ============== Secondary ==============
  final Color secondary;
  final Color secondaryVariant;

  // ============== Surface ==============
  final Color surfaceLow;
  final Color surface;
  final Color surfaceHigh;

  // ============== Text ==============
  final Color title;
  final Color body;
  final Color hint;
  final Color textPrimary;
  final Color textSecondary;
  final Color textBody;
  final Color textWarning;

  // ============== Border & Stroke ==============
  final Color stroke;
  final Color disabled;

  // ============== Semantic: Error ==============
  final Color error;
  final Color onError;

  // ============== Cards  ==============
  final Color cardBackground;
  final Color cardBackgroundSecondary;

  // ============== Bars  ==============
  final Color bottomNavBarBgColor;
  final Color statusBarColor;



  const WorkMateColorScheme({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.surfaceLow,
    required this.surface,
    required this.surfaceHigh,
    required this.title,
    required this.body,
    required this.hint,
    required this.textPrimary,
    required this.textSecondary,
    required this.textBody,
    required this.textWarning,
    required this.stroke,
    required this.disabled,
    required this.error,
    required this.onError,
    required this.gray25,
    required this.gray50,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.gray400,
    required this.gray500,
    required this.gray600,
    required this.gray700,
    required this.gray800,
    required this.gray900,
    required this.purple25,
    required this.purple50,
    required this.purple100,
    required this.purple200,
    required this.purple300,
    required this.purple400,
    required this.purple500,
    required this.purple600,
    required this.purple700,
    required this.purple800,
    required this.purple900,
    required this.success25,
    required this.success50,
    required this.success100,
    required this.success200,
    required this.success300,
    required this.success400,
    required this.success500,
    required this.success600,
    required this.success700,
    required this.success800,
    required this.success900,
    required this.error25,
    required this.error50,
    required this.error100,
    required this.error200,
    required this.error300,
    required this.error400,
    required this.error500,
    required this.error600,
    required this.error700,
    required this.error800,
    required this.error900,
    required this.warning25,
    required this.warning50,
    required this.warning100,
    required this.warning200,
    required this.warning300,
    required this.warning400,
    required this.warning500,
    required this.warning600,
    required this.warning700,
    required this.warning800,
    required this.warning900,
    required this.yellow25,
    required this.yellow50,
    required this.yellow100,
    required this.yellow200,
    required this.yellow300,
    required this.yellow400,
    required this.yellow500,
    required this.yellow600,
    required this.yellow700,
    required this.yellow800,
    required this.yellow900,
    required this.black,
    required this.white,
    required this.pureWhite,
    required this.offWhite,
    required this.baseWhite,
    required this.cardBackground,
    required this.bottomNavBarBgColor,
    required this.cardBackgroundSecondary,
    required this.statusBarColor,

  });

  static const light = WorkMateColorScheme(
    primary: AppConstantColors.purple600,
    primaryVariant: AppConstantColors.purple50,
    onPrimary: AppConstantColors.pureWhite,
    secondary: AppConstantColors.warning500,
    secondaryVariant: AppConstantColors.warning50,
    surfaceLow: AppConstantColors.pureWhite,
    surface: AppConstantColors.gray25,
    surfaceHigh: AppConstantColors.gray50,
    title: AppConstantColors.gray900,
    body: AppConstantColors.gray600,
    hint: AppConstantColors.gray400,
    textPrimary: AppConstantColors.textPrimary,
    textSecondary: AppConstantColors.textSecondary,
    textBody: AppConstantColors.textBody,
    textWarning: AppConstantColors.textWarning,
    stroke: AppConstantColors.gray100,
    disabled: AppConstantColors.gray200,
    error: AppConstantColors.error500,
    onError: AppConstantColors.pureWhite,

    gray25: AppConstantColors.gray25,
    gray50: AppConstantColors.gray50,
    gray100: AppConstantColors.gray100,
    gray200: AppConstantColors.gray200,
    gray300: AppConstantColors.gray300,
    gray400: AppConstantColors.gray400,
    gray500: AppConstantColors.gray500,
    gray600: AppConstantColors.gray600,
    gray700: AppConstantColors.gray700,
    gray800: AppConstantColors.gray800,
    gray900: AppConstantColors.gray900,
    purple25: AppConstantColors.purple25,
    purple50: AppConstantColors.purple50,
    purple100: AppConstantColors.purple100,
    purple200: AppConstantColors.purple200,
    purple300: AppConstantColors.purple300,
    purple400: AppConstantColors.purple400,
    purple500: AppConstantColors.purple500,
    purple600: AppConstantColors.purple600,
    purple700: AppConstantColors.purple700,
    purple800: AppConstantColors.purple800,
    purple900: AppConstantColors.purple900,
    success25: AppConstantColors.success25,
    success50: AppConstantColors.success50,
    success100: AppConstantColors.success100,
    success200: AppConstantColors.success200,
    success300: AppConstantColors.success300,
    success400: AppConstantColors.success400,
    success500: AppConstantColors.success500,
    success600: AppConstantColors.success600,
    success700: AppConstantColors.success700,
    success800: AppConstantColors.success800,
    success900: AppConstantColors.success900,
    error25: AppConstantColors.error25,
    error50: AppConstantColors.error50,
    error100: AppConstantColors.error100,
    error200: AppConstantColors.error200,
    error300: AppConstantColors.error300,
    error400: AppConstantColors.error400,
    error500: AppConstantColors.error500,
    error600: AppConstantColors.error600,
    error700: AppConstantColors.error700,
    error800: AppConstantColors.error800,
    error900: AppConstantColors.error900,
    warning25: AppConstantColors.warning25,
    warning50: AppConstantColors.warning50,
    warning100: AppConstantColors.warning100,
    warning200: AppConstantColors.warning200,
    warning300: AppConstantColors.warning300,
    warning400: AppConstantColors.warning400,
    warning500: AppConstantColors.warning500,
    warning600: AppConstantColors.warning600,
    warning700: AppConstantColors.warning700,
    warning800: AppConstantColors.warning800,
    warning900: AppConstantColors.warning900,
    yellow25: AppConstantColors.yellow25,
    yellow50: AppConstantColors.yellow50,
    yellow100: AppConstantColors.yellow100,
    yellow200: AppConstantColors.yellow200,
    yellow300: AppConstantColors.yellow300,
    yellow400: AppConstantColors.yellow400,
    yellow500: AppConstantColors.yellow500,
    yellow600: AppConstantColors.yellow600,
    yellow700: AppConstantColors.yellow700,
    yellow800: AppConstantColors.yellow800,
    yellow900: AppConstantColors.yellow900,
    black: AppConstantColors.black,
    white: AppConstantColors.white,
    pureWhite: AppConstantColors.pureWhite,
    offWhite: AppConstantColors.offWhite,
    baseWhite: AppConstantColors.baseWhite,
    cardBackground: AppConstantColors.cardBackground,
    cardBackgroundSecondary: AppConstantColors.cardBackgroundSecondary,
    bottomNavBarBgColor: AppConstantColors.bottomNavBarBgColor,
    statusBarColor: AppConstantColors.statusBarColor,
  );

  static const dark = WorkMateColorScheme(
    primary: AppConstantColors.purple400,
    primaryVariant: AppConstantColors.purple900,
    onPrimary: AppConstantColors.pureWhite,
    secondary: AppConstantColors.warning400,
    secondaryVariant: AppConstantColors.warning900,
    surfaceLow: AppConstantColors.gray900,
    surface: AppConstantColors.gray800,
    surfaceHigh: AppConstantColors.gray700,
    title: AppConstantColors.gray25,
    body: AppConstantColors.gray200,
    hint: AppConstantColors.gray400,
    textPrimary: AppConstantColors.textPrimary,
    textSecondary: AppConstantColors.textSecondary,
    textBody: AppConstantColors.textBody,
    textWarning: AppConstantColors.textWarning,
    stroke: AppConstantColors.gray700,
    disabled: AppConstantColors.gray600,
    error: AppConstantColors.error400,
    onError: AppConstantColors.pureWhite,

    gray25: AppConstantColors.gray25,
    gray50: AppConstantColors.gray50,
    gray100: AppConstantColors.gray100,
    gray200: AppConstantColors.gray200,
    gray300: AppConstantColors.gray300,
    gray400: AppConstantColors.gray400,
    gray500: AppConstantColors.gray500,
    gray600: AppConstantColors.gray600,
    gray700: AppConstantColors.gray700,
    gray800: AppConstantColors.gray800,
    gray900: AppConstantColors.gray900,
    purple25: AppConstantColors.purple25,
    purple50: AppConstantColors.purple50,
    purple100: AppConstantColors.purple100,
    purple200: AppConstantColors.purple200,
    purple300: AppConstantColors.purple300,
    purple400: AppConstantColors.purple400,
    purple500: AppConstantColors.purple500,
    purple600: AppConstantColors.purple600,
    purple700: AppConstantColors.purple700,
    purple800: AppConstantColors.purple800,
    purple900: AppConstantColors.purple900,
    success25: AppConstantColors.success25,
    success50: AppConstantColors.success50,
    success100: AppConstantColors.success100,
    success200: AppConstantColors.success200,
    success300: AppConstantColors.success300,
    success400: AppConstantColors.success400,
    success500: AppConstantColors.success500,
    success600: AppConstantColors.success600,
    success700: AppConstantColors.success700,
    success800: AppConstantColors.success800,
    success900: AppConstantColors.success900,
    error25: AppConstantColors.error25,
    error50: AppConstantColors.error50,
    error100: AppConstantColors.error100,
    error200: AppConstantColors.error200,
    error300: AppConstantColors.error300,
    error400: AppConstantColors.error400,
    error500: AppConstantColors.error500,
    error600: AppConstantColors.error600,
    error700: AppConstantColors.error700,
    error800: AppConstantColors.error800,
    error900: AppConstantColors.error900,
    warning25: AppConstantColors.warning25,
    warning50: AppConstantColors.warning50,
    warning100: AppConstantColors.warning100,
    warning200: AppConstantColors.warning200,
    warning300: AppConstantColors.warning300,
    warning400: AppConstantColors.warning400,
    warning500: AppConstantColors.warning500,
    warning600: AppConstantColors.warning600,
    warning700: AppConstantColors.warning700,
    warning800: AppConstantColors.warning800,
    warning900: AppConstantColors.warning900,
    yellow25: AppConstantColors.yellow25,
    yellow50: AppConstantColors.yellow50,
    yellow100: AppConstantColors.yellow100,
    yellow200: AppConstantColors.yellow200,
    yellow300: AppConstantColors.yellow300,
    yellow400: AppConstantColors.yellow400,
    yellow500: AppConstantColors.yellow500,
    yellow600: AppConstantColors.yellow600,
    yellow700: AppConstantColors.yellow700,
    yellow800: AppConstantColors.yellow800,
    yellow900: AppConstantColors.yellow900,
    black: AppConstantColors.black,
    white: AppConstantColors.white,
    pureWhite: AppConstantColors.pureWhite,
    offWhite: AppConstantColors.offWhite,
    baseWhite: AppConstantColors.baseWhite,
    cardBackground: AppConstantColors.cardBackground,
    cardBackgroundSecondary: AppConstantColors.cardBackgroundSecondary,
    bottomNavBarBgColor: AppConstantColors.bottomNavBarBgColor,
    statusBarColor: AppConstantColors.statusBarColor,
  );

  @override
  ThemeExtension<WorkMateColorScheme> copyWith({
    Color? primary,
    Color? primaryVariant,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryVariant,
    Color? surfaceLow,
    Color? surface,
    Color? surfaceHigh,
    Color? title,
    Color? body,
    Color? hint,
    Color? textPrimary,
    Color? textSecondary,
    Color? textBody,
    Color? textWarning,
    Color? stroke,
    Color? disabled,
    Color? error,
    Color? onError,
    Color? success,
    Color? successVariant,
    Color? onSuccess,
    Color? warning,
    Color? warningVariant,
    Color? onWarning,
    Color? gray25,
    Color? gray50,
    Color? gray100,
    Color? gray200,
    Color? gray300,
    Color? gray400,
    Color? gray500,
    Color? gray600,
    Color? gray700,
    Color? gray800,
    Color? gray900,
    Color? purple25,
    Color? purple50,
    Color? purple100,
    Color? purple200,
    Color? purple300,
    Color? purple400,
    Color? purple500,
    Color? purple600,
    Color? purple700,
    Color? purple800,
    Color? purple900,
    Color? success25,
    Color? success50,
    Color? success100,
    Color? success200,
    Color? success300,
    Color? success400,
    Color? success500,
    Color? success600,
    Color? success700,
    Color? success800,
    Color? success900,
    Color? error25,
    Color? error50,
    Color? error100,
    Color? error200,
    Color? error300,
    Color? error400,
    Color? error500,
    Color? error600,
    Color? error700,
    Color? error800,
    Color? error900,
    Color? warning25,
    Color? warning50,
    Color? warning100,
    Color? warning200,
    Color? warning300,
    Color? warning400,
    Color? warning500,
    Color? warning600,
    Color? warning700,
    Color? warning800,
    Color? warning900,
    Color? yellow25,
    Color? yellow50,
    Color? yellow100,
    Color? yellow200,
    Color? yellow300,
    Color? yellow400,
    Color? yellow500,
    Color? yellow600,
    Color? yellow700,
    Color? yellow800,
    Color? yellow900,
    Color? black,
    Color? white,
    Color? pureWhite,
    Color? offWhite,
    Color? baseWhite,
    Color? cardBackground,
    Color? cardBackgroundSecondary,
    Color? bottomNavBarBgColor,
    Color? statusBarColor,
  }) {
    return WorkMateColorScheme(
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      surfaceLow: surfaceLow ?? this.surfaceLow,
      surface: surface ?? this.surface,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      title: title ?? this.title,
      body: body ?? this.body,
      hint: hint ?? this.hint,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textBody: textBody ?? this.textBody,
      textWarning: textWarning ?? this.textWarning,
      stroke: stroke ?? this.stroke,
      disabled: disabled ?? this.disabled,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      gray25: gray25 ?? this.gray25,
      gray50: gray50 ?? this.gray50,
      gray100: gray100 ?? this.gray100,
      gray200: gray200 ?? this.gray200,
      gray300: gray300 ?? this.gray300,
      gray400: gray400 ?? this.gray400,
      gray500: gray500 ?? this.gray500,
      gray600: gray600 ?? this.gray600,
      gray700: gray700 ?? this.gray700,
      gray800: gray800 ?? this.gray800,
      gray900: gray900 ?? this.gray900,
      purple25: purple25 ?? this.purple25,
      purple50: purple50 ?? this.purple50,
      purple100: purple100 ?? this.purple100,
      purple200: purple200 ?? this.purple200,
      purple300: purple300 ?? this.purple300,
      purple400: purple400 ?? this.purple400,
      purple500: purple500 ?? this.purple500,
      purple600: purple600 ?? this.purple600,
      purple700: purple700 ?? this.purple700,
      purple800: purple800 ?? this.purple800,
      purple900: purple900 ?? this.purple900,
      success25: success25 ?? this.success25,
      success50: success50 ?? this.success50,
      success100: success100 ?? this.success100,
      success200: success200 ?? this.success200,
      success300: success300 ?? this.success300,
      success400: success400 ?? this.success400,
      success500: success500 ?? this.success500,
      success600: success600 ?? this.success600,
      success700: success700 ?? this.success700,
      success800: success800 ?? this.success800,
      success900: success900 ?? this.success900,
      error25: error25 ?? this.error25,
      error50: error50 ?? this.error50,
      error100: error100 ?? this.error100,
      error200: error200 ?? this.error200,
      error300: error300 ?? this.error300,
      error400: error400 ?? this.error400,
      error500: error500 ?? this.error500,
      error600: error600 ?? this.error600,
      error700: error700 ?? this.error700,
      error800: error800 ?? this.error800,
      error900: error900 ?? this.error900,
      warning25: warning25 ?? this.warning25,
      warning50: warning50 ?? this.warning50,
      warning100: warning100 ?? this.warning100,
      warning200: warning200 ?? this.warning200,
      warning300: warning300 ?? this.warning300,
      warning400: warning400 ?? this.warning400,
      warning500: warning500 ?? this.warning500,
      warning600: warning600 ?? this.warning600,
      warning700: warning700 ?? this.warning700,
      warning800: warning800 ?? this.warning800,
      warning900: warning900 ?? this.warning900,
      yellow25: yellow25 ?? this.yellow25,
      yellow50: yellow50 ?? this.yellow50,
      yellow100: yellow100 ?? this.yellow100,
      yellow200: yellow200 ?? this.yellow200,
      yellow300: yellow300 ?? this.yellow300,
      yellow400: yellow400 ?? this.yellow400,
      yellow500: yellow500 ?? this.yellow500,
      yellow600: yellow600 ?? this.yellow600,
      yellow700: yellow700 ?? this.yellow700,
      yellow800: yellow800 ?? this.yellow800,
      yellow900: yellow900 ?? this.yellow900,
      black: black ?? this.black,
      white: white ?? this.white,
      pureWhite: pureWhite ?? this.pureWhite,
      offWhite: offWhite ?? this.offWhite,
      baseWhite: baseWhite ?? this.baseWhite,
      cardBackground: cardBackground ?? this.cardBackground,
      cardBackgroundSecondary: cardBackgroundSecondary ?? this.cardBackgroundSecondary,
      bottomNavBarBgColor: bottomNavBarBgColor ?? this.bottomNavBarBgColor,
      statusBarColor: statusBarColor ?? this.statusBarColor,
    );
  }

  @override
  ThemeExtension<WorkMateColorScheme> lerp(
    covariant ThemeExtension<WorkMateColorScheme>? other,
    double t,
  ) {
    if (other is! WorkMateColorScheme) return this;
    return WorkMateColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryVariant: Color.lerp(secondaryVariant, other.secondaryVariant, t,)!,
      surfaceLow: Color.lerp(surfaceLow, other.surfaceLow, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t)!,
      title: Color.lerp(title, other.title, t)!,
      body: Color.lerp(body, other.body, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      textWarning: Color.lerp(textWarning, other.textWarning, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,

      gray25: Color.lerp(gray25, other.gray25, t)!,
      gray50: Color.lerp(gray50, other.gray50, t)!,
      gray100: Color.lerp(gray100, other.gray100, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      gray400: Color.lerp(gray400, other.gray400, t)!,
      gray500: Color.lerp(gray500, other.gray500, t)!,
      gray600: Color.lerp(gray600, other.gray600, t)!,
      gray700: Color.lerp(gray700, other.gray700, t)!,
      gray800: Color.lerp(gray800, other.gray800, t)!,
      gray900: Color.lerp(gray900, other.gray900, t)!,
      purple25: Color.lerp(purple25, other.purple25, t)!,
      purple50: Color.lerp(purple50, other.purple50, t)!,
      purple100: Color.lerp(purple100, other.purple100, t)!,
      purple200: Color.lerp(purple200, other.purple200, t)!,
      purple300: Color.lerp(purple300, other.purple300, t)!,
      purple400: Color.lerp(purple400, other.purple400, t)!,
      purple500: Color.lerp(purple500, other.purple500, t)!,
      purple600: Color.lerp(purple600, other.purple600, t)!,
      purple700: Color.lerp(purple700, other.purple700, t)!,
      purple800: Color.lerp(purple800, other.purple800, t)!,
      purple900: Color.lerp(purple900, other.purple900, t)!,
      success25: Color.lerp(success25, other.success25, t)!,
      success50: Color.lerp(success50, other.success50, t)!,
      success100: Color.lerp(success100, other.success100, t)!,
      success200: Color.lerp(success200, other.success200, t)!,
      success300: Color.lerp(success300, other.success300, t)!,
      success400: Color.lerp(success400, other.success400, t)!,
      success500: Color.lerp(success500, other.success500, t)!,
      success600: Color.lerp(success600, other.success600, t)!,
      success700: Color.lerp(success700, other.success700, t)!,
      success800: Color.lerp(success800, other.success800, t)!,
      success900: Color.lerp(success900, other.success900, t)!,
      error25: Color.lerp(error25, other.error25, t)!,
      error50: Color.lerp(error50, other.error50, t)!,
      error100: Color.lerp(error100, other.error100, t)!,
      error200: Color.lerp(error200, other.error200, t)!,
      error300: Color.lerp(error300, other.error300, t)!,
      error400: Color.lerp(error400, other.error400, t)!,
      error500: Color.lerp(error500, other.error500, t)!,
      error600: Color.lerp(error600, other.error600, t)!,
      error700: Color.lerp(error700, other.error700, t)!,
      error800: Color.lerp(error800, other.error800, t)!,
      error900: Color.lerp(error900, other.error900, t)!,
      warning25: Color.lerp(warning25, other.warning25, t)!,
      warning50: Color.lerp(warning50, other.warning50, t)!,
      warning100: Color.lerp(warning100, other.warning100, t)!,
      warning200: Color.lerp(warning200, other.warning200, t)!,
      warning300: Color.lerp(warning300, other.warning300, t)!,
      warning400: Color.lerp(warning400, other.warning400, t)!,
      warning500: Color.lerp(warning500, other.warning500, t)!,
      warning600: Color.lerp(warning600, other.warning600, t)!,
      warning700: Color.lerp(warning700, other.warning700, t)!,
      warning800: Color.lerp(warning800, other.warning800, t)!,
      warning900: Color.lerp(warning900, other.warning900, t)!,
      yellow25: Color.lerp(yellow25, other.yellow25, t)!,
      yellow50: Color.lerp(yellow50, other.yellow50, t)!,
      yellow100: Color.lerp(yellow100, other.yellow100, t)!,
      yellow200: Color.lerp(yellow200, other.yellow200, t)!,
      yellow300: Color.lerp(yellow300, other.yellow300, t)!,
      yellow400: Color.lerp(yellow400, other.yellow400, t)!,
      yellow500: Color.lerp(yellow500, other.yellow500, t)!,
      yellow600: Color.lerp(yellow600, other.yellow600, t)!,
      yellow700: Color.lerp(yellow700, other.yellow700, t)!,
      yellow800: Color.lerp(yellow800, other.yellow800, t)!,
      yellow900: Color.lerp(yellow900, other.yellow900, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      pureWhite: Color.lerp(pureWhite, other.pureWhite, t)!,
      offWhite: Color.lerp(offWhite, other.offWhite, t)!,
      baseWhite: Color.lerp(baseWhite, other.baseWhite, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      cardBackgroundSecondary: Color.lerp(cardBackgroundSecondary, other.cardBackgroundSecondary, t)!,
      bottomNavBarBgColor: Color.lerp(bottomNavBarBgColor, other.bottomNavBarBgColor, t)!,
      statusBarColor: Color.lerp(statusBarColor, other.statusBarColor, t)!,
    );
  }
}
