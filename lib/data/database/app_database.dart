import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:todoer/data/dao/invitee_dao.dart';
import 'package:todoer/data/models/user_settings.dart';
import 'package:todoer/data/models/users.dart';

import '../../enum/app_theme_options.dart';
import '../models/events.dart';
import '../models/invitees.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [UserSettings, Users, Events, Invitees])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 3;

  // see more details on
  // https://drift.simonbinder.eu/docs/advanced-features/migrations/
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // disable foreign_keys before migrations
        await customStatement('PRAGMA foreign_keys = OFF');

        if (from < 2) {
          await m.addColumn(users, users.name);
        }
        if (from < 3) {
          await m.createTable(events);
          await m.createTable(invitees);
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<Event> getEventById({required int eventId}) {
    return (select(events)..where((t) => t.id.equals(eventId))).getSingle();
  }

  Future<List<Event>> getAllEvents() {
    final query = select(events);
    query.orderBy([
      (t) => OrderingTerm.asc(t.happenedAt),
    ]);
    return query.get();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
