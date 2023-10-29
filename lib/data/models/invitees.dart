import 'package:drift/drift.dart';
import 'package:todoer/data/models/events.dart';

@DataClassName('Invitee')
class Invitees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get event => integer().nullable().references(
        Events,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();
}
