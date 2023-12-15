import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/display_items/displayable.dart';

//TODO fix unknown height issue
class TableCalendarWidget extends StatefulWidget {
  final DateTime focusedDay;
  final Function(DateTime day) onDaySelected;
  final Map<DateDisplayItem, List<EventDisplayItem>>? eventDisplayItemMap;
  final CalendarFormat calendarFormat;
  final firstDay = DateTime.utc(2023, 10, 1);
  final lastDay = DateTime.utc(2024, 12, 31);

  TableCalendarWidget({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
    this.eventDisplayItemMap,
    this.calendarFormat = CalendarFormat.month,
  });

  @override
  State<StatefulWidget> createState() => TableCalendarWidgetState();
}

class TableCalendarWidgetState extends State<TableCalendarWidget> {
  late DateTime _focusedDay = widget.focusedDay;
  late DateTime _selectedDay = widget.focusedDay;
  late CalendarFormat calendarFormat = widget.calendarFormat;
  late final List<EventDisplayItem> Function(DateTime day)? eventLoader;

  @override
  void initState() {
    final eventDisplayItemMap = widget.eventDisplayItemMap;
    if (eventDisplayItemMap != null) {
      eventLoader = (day) {
        final recordEntry =
            eventDisplayItemMap.entries.firstWhereOrNull((entry) {
          return DateUtils.isSameDay(day, entry.key.dateTime);
        });
        if (recordEntry == null) return const [];
        return recordEntry.value;
      };
    } else {
      eventLoader = null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TableCalendar<EventDisplayItem>(
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
        focusedDay: _focusedDay,
        currentDay: _selectedDay,
        calendarFormat: calendarFormat,
        headerVisible: true,
        eventLoader: eventLoader,
        // based on requirement
        // calendarBuilders:
        //     CalendarBuilders(markerBuilder: (context, day, eventDisplayItems) {
        //   final eventLength = eventDisplayItems.length;
        //   if (eventLength == 0) {
        //     return null;
        //   }
        //   return Positioned(
        //     right: 0,
        //     bottom: 0,
        //     child: LabelSmallText(
        //       eventDisplayItems.length.toString(),
        //       fontWeight: FontWeight.bold,
        //       textColor: Theme.of(context).colorScheme.secondary,
        //     ),
        //   );
        // }),
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
