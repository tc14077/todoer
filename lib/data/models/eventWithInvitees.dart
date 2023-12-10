// We define a data class to contain both a event entry and the associated
// invitees.
import 'package:todoer/data/database/app_database.dart';

class EventWithInvitee {
  EventWithInvitee(this.event, this.invitee);

  final Event event;
  final Invitee invitee;
}