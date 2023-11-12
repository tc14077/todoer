import 'package:drift/drift.dart';
import 'package:todoer/data/models/base_table.dart';

@DataClassName('Event')
class Events extends BaseTable {
  TextColumn get name => text()();
  DateTimeColumn get happenedAt => dateTime()();
}
