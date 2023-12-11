import 'package:drift/drift.dart';
import 'package:todoer/data/models/base_table.dart';

@DataClassName('User')
class Users extends BaseTable {
  TextColumn get name => text()();
}
