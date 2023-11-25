// We define a data class to contain both a event entry and the associated
// invitees.
part of 'displayable.dart';
final class EventDisplayItem extends Equatable implements Comparable<EventDisplayItem>, Displayable {
  const EventDisplayItem(this.event, {this.invitees});

  final Event event;
  final List<Invitee>? invitees;

  @override
  List<Object?> get props => [event, invitees];

  @override
  int compareTo(other) {
    return event.compareHappenedDateTo(other.event);
  }
}
