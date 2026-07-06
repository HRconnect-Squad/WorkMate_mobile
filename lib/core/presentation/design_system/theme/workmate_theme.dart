import 'package:flutter/material.dart';
import 'package:workmate/core/presentation/design_system/theme/typography/workmate_text_style.dart';
import 'color/workmate_color_scheme.dart';

class WorkMateTheme {
  WorkMateTheme._();

  static ThemeData light() {
    const workMateColors = WorkMateColorScheme.light;
    const workMateTextStyle = WorkMateTextStyle.workMateTextStyle;
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.light(
          primary: workMateColors.primary,
          onPrimary: workMateColors.onPrimary,
          secondary: workMateColors.secondary,
          surface: workMateColors.surface,
          error: workMateColors.error,
          onError: workMateColors.onError,
        ),
        extensions: const [
          workMateColors,
          workMateTextStyle,
        ],
    );
  }

  static ThemeData dark() {
    const workMateColors = WorkMateColorScheme.dark;
    const workMateTextStyle = WorkMateTextStyle.workMateTextStyle;
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: workMateColors.primary,
          onPrimary: workMateColors.onPrimary,
          secondary: workMateColors.secondary,
          surface: workMateColors.surface,
          error: workMateColors.error,
          onError: workMateColors.onError,
        ),
        extensions: const [
          workMateColors,
          workMateTextStyle,
        ],
    );
  }

}
