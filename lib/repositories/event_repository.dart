import '../data/database/app_database.dart';
import '../data/models/events.dart';
import 'base_repository.dart';

class EventRepository extends BasePersistRepository<Events, Event>{
  EventRepository(super.dao);
}
