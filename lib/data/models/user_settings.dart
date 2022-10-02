import 'package:drift/drift.dart';
import 'package:todoer/enum/app_theme_options.dart';

@DataClassName('UserSetting')
class UserSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get theme => text().map(const AppThemeOptionConverter())();
}
