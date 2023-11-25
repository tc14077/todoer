// We define a data class to contain both a DataTime object
import 'package:equatable/equatable.dart';
import 'package:todoer/data/display_items/displayable.dart';
class DateDisplayItem extends Equatable implements Comparable<DateDisplayItem>, Displayable {
  const DateDisplayItem(this.dateTime);

  final DateTime dateTime;

  @override
  List<Object?> get props => [dateTime];

  @override
  int compareTo(other) {
    return dateTime.compareTo(other.dateTime);
  }
}
