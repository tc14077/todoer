import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  final DateTime focusedDay;
  final Function(DateTime day) onDaySelected;
  final CalendarFormat calendarFormat;
  final firstDay = DateTime.utc(2023, 10, 1);
  final lastDay = DateTime.utc(2023, 12, 31);

  TableCalendarWidget({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
    this.calendarFormat = CalendarFormat.month,
  });

  @override
  State<StatefulWidget> createState() => TableCalendarWidgetState();
}

class TableCalendarWidgetState extends State<TableCalendarWidget> {
  late DateTime _focusedDay = widget.focusedDay;
  late DateTime _selectedDay = widget.focusedDay;
  late CalendarFormat calendarFormat = widget.calendarFormat;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TableCalendar(
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
        focusedDay: _focusedDay,
        calendarFormat: calendarFormat,
        headerVisible: false,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
