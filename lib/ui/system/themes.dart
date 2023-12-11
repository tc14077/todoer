import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoer/ui/system/custom_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: CustomColors.seedColor,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
  );

  static ThemeData darkTheme = ThemeData(
      colorSchemeSeed: CustomColors.seedColor,
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme));
}
