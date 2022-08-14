import 'package:flutter/material.dart';
import 'package:todoer/ui/system/themes.dart';

enum AppThemeOption {
  light(themeMode: ThemeMode.light, displayName: 'Day theme'),
  dark(themeMode: ThemeMode.dark, displayName: 'Dark theme');
  // system(themeMode: ThemeMode.system, displayName: 'System theme'),
  // custom(themeMode: null, displayName: 'Custom theme');

  final ThemeMode? themeMode;
  final String displayName;
  const AppThemeOption({this.themeMode, required this.displayName});

  ThemeData? get themeData {
    switch (this) {
      case AppThemeOption.light:
        return AppTheme.lightTheme;
      case AppThemeOption.dark:
        return AppTheme.darkTheme;
      // case AppThemeOption.system:
      // case AppThemeOption.custom:
      //   return null;
    }
  }
}
