import 'package:flutter/material.dart';

import '../color/workmate_color_scheme.dart';
import '../typography/workmate_text_style.dart';

extension WorkMateThemeExtension on BuildContext {
  WorkMateColorScheme get colors => Theme.of(this).extension<WorkMateColorScheme>()!;
  WorkMateTextStyle get textTheme => Theme.of(this).extension<WorkMateTextStyle>()!;
}