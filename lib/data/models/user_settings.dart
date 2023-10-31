import 'package:drift/drift.dart';
import 'package:todoer/data/models/base_table.dart';
import 'package:todoer/enum/app_theme_options.dart';

@DataClassName('UserSetting')
class UserSettings extends BaseTable {
  IntColumn get userId => integer()();
  TextColumn get theme => text().map(const AppThemeOptionConverter())();
}
