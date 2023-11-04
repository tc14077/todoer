// import 'package:drift/drift.dart';
// import 'package:todoer/data/database/app_database.dart';

// part 'invitee_dao.g.dart';

// // the _$InviteesDaoMixin will be created by drift. It contains all the necessary
// // fields for the tables. The <MyDatabase> type annotation is the database class
// // that should use this dao.
// @DriftAccessor(tables: [Invitee])
// class InviteesDao extends DatabaseAccessor<AppDatabase>
//     with _$InviteesDaoMixin {
//   InviteesDao(AppDatabase db) : super(db);

//   Future<List<Invitee>> inviteesInEvent(Event event) {
//     return (select(db.invitees)..where((t) => t.event.equals(event.id))).get();
//   }
// }

import 'package:todoer/data/database/app_database.dart';
import 'package:todoer/data/models/invitees.dart';

import 'base_dao.dart';

class InviteeDao extends BaseDao<Invitees, Invitee> {
  final AppDatabase db;
  InviteeDao(this.db)
      : super(
          appDatabase: db,
          table: db.invitees,
        );

  Future<List<Invitee>> inviteesInEvent(Event event) {
    return (db.select(db.invitees)..where((t) => t.event.equals(event.id))).get();
  }
}
