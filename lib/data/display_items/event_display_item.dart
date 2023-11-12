// We define a data class to contain both a event entry and the associated
// invitees.
import 'package:equatable/equatable.dart';
import 'package:todoer/data/database/app_database.dart';
import 'package:todoer/data/models/events.dart';

class EventDisplayItem extends Equatable implements Comparable{
  const EventDisplayItem(this.event, {this.invitees});

  final Event event;
  final List<Invitee>? invitees;

  @override
  List<Object?> get props => [event, invitees];
  
  @override
  int compareTo(other) {
    return event.compareHappenedDateTo(other);
  }
}
