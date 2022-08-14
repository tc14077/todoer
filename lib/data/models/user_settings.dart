import 'package:drift/drift.dart';
import 'package:todoer/enum/app_theme_options.dart';

class UserSettings extends Table {
  TextColumn get selectedLanguage =>
      text().map(const AppThemeOptionConverter())();
}
