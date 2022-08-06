import 'package:flutter/material.dart';
import 'package:todoer/ui/system/themes.dart';

enum AppThemeOptions {
  light(themeMode: ThemeMode.light),
  dark(themeMode: ThemeMode.dark),
  system(themeMode: ThemeMode.system),
  custom(themeMode: null);

  final ThemeMode? themeMode;
  const AppThemeOptions({this.themeMode});

  ThemeData? get themeData {
    switch (this) {
      case AppThemeOptions.light:
        return AppTheme.lightTheme;
      case AppThemeOptions.dark:
        return AppTheme.darkTheme;
      case AppThemeOptions.system:
      case AppThemeOptions.custom:
        return null;
    }
  }
}
