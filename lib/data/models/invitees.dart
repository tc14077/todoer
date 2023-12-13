import 'package:drift/drift.dart';
import 'package:todoer/data/models/base_table.dart';
import 'package:todoer/data/models/events.dart';

@DataClassName('Invitee')
class Invitees extends BaseTable {
  TextColumn get name => text()();
  TextColumn get countryCode => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  IntColumn get event => integer().nullable().references(
        Events,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();
}
