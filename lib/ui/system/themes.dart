import 'package:flutter/material.dart';
import 'package:todoer/ui/system/custom_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: CustomColors.seedColor,
    useMaterial3: true,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    colorSchemeSeed: CustomColors.seedColor,
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}
