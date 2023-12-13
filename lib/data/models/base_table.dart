import 'package:drift/drift.dart';

abstract class BaseTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
