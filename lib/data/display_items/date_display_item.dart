part of 'displayable.dart';

/// We define a data class to contain both a DataTime object
final class DateDisplayItem extends Equatable
    implements Comparable<DateDisplayItem>, Displayable {
  const DateDisplayItem(this.dateTime);

  final DateTime dateTime;

  @override
  List<Object?> get props => [dateTime];

  @override
  int compareTo(other) {
    return dateTime.compareTo(other.dateTime);
  }
}
