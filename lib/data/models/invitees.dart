import 'package:drift/drift.dart';
import 'package:todoer/data/models/base_table.dart';
import 'package:todoer/data/models/events.dart';

@DataClassName('Invitee')
class Invitees extends BaseTable {
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get event => integer().nullable().references(
        Events,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();
}
