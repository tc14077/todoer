// MOCKING
import 'package:todoer/data/models/invitee.dart';

class Event {
  final String name;
  final DateTime time;
  final List<Invitee>? invitees;

  Event(this.name, this.time, {this.invitees});
}
