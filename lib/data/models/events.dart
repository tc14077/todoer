import 'package:drift/drift.dart';
import 'package:todoer/data/database/app_database.dart';
import 'package:todoer/data/models/base_table.dart';

@DataClassName('Event')
class Events extends BaseTable {
  TextColumn get name => text()();
  DateTimeColumn get happenedAt => dateTime()();
}

extension EventExtension on Event {
  int compareHappenedDateTo(Event other) {
    final otherIsHappenedAt = other.happenedAt;
    if (happenedAt.isAtSameMomentAs(otherIsHappenedAt)) return 0;
    if (happenedAt.isBefore(otherIsHappenedAt)) return -1;
    return 1;
  }
}
