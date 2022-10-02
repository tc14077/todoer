import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:todoer/ui/system/themes.dart';

enum AppThemeOption {
  light(id: 'light', themeMode: ThemeMode.light, displayName: 'Day theme'),
  dark(id: 'night', themeMode: ThemeMode.dark, displayName: 'Dark theme');
  // system(themeMode: ThemeMode.system, displayName: 'System theme'),
  // custom(themeMode: null, displayName: 'Custom theme');

  final String id;
  final ThemeMode? themeMode;
  final String displayName;
  const AppThemeOption(
      {required this.id, this.themeMode, required this.displayName});

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

  static AppThemeOption? fromID(String id) =>
      values.firstWhereOrNull((option) => option.id == id);
}

class AppThemeOptionConverter extends TypeConverter<AppThemeOption, String> {
  const AppThemeOptionConverter();

  @override
  AppThemeOption fromSql(String fromDb) {
    return AppThemeOption.fromID(fromDb) ?? AppThemeOption.light;
  }

  @override
  String toSql(AppThemeOption value) {
    // TODO: implement toSql
    throw UnimplementedError();
  }
}
