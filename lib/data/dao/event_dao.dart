import 'package:todoer/data/dao/base_dao.dart';
import 'package:todoer/data/database/app_database.dart';

import '../models/events.dart';

class EventsDao extends BaseDao<Events, Event> {
  EventsDao(AppDatabase db)
      : super(
          appDatabase: db,
          table: db.events,
        );
}
