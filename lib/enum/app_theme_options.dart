import 'package:flutter/material.dart';
import 'package:todoer/ui/system/themes.dart';

enum AppThemeOption {
  light(themeMode: ThemeMode.light),
  dark(themeMode: ThemeMode.dark),
  system(themeMode: ThemeMode.system),
  custom(themeMode: null);

  final ThemeMode? themeMode;
  const AppThemeOption({this.themeMode});

  ThemeData? get themeData {
    switch (this) {
      case AppThemeOption.light:
        return AppTheme.lightTheme;
      case AppThemeOption.dark:
        return AppTheme.darkTheme;
      case AppThemeOption.system:
      case AppThemeOption.custom:
        return null;
    }
  }
}
