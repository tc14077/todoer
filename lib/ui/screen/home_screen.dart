import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/ui/system/themed_text.dart';
import 'package:todoer/ui/widget/animated_event_list.dart';

import '../../data/models/event.dart';
import '../widget/table_calendar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final mocking = [
  Event(
    'Booking 1',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 2',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 3',
    DateTime(2023, 11, 2, 13, 00),
  ),
  Event(
    'Booking 1',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 2',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 3',
    DateTime(2023, 11, 2, 13, 00),
  ),
  Event(
    'Booking 1',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 2',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 3',
    DateTime(2023, 11, 2, 13, 00),
  ),
  Event(
    'Booking 1',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 2',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 3',
    DateTime(2023, 11, 2, 13, 00),
  ),
  Event(
    'Booking 1',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 2',
    DateTime(2023, 11, 1, 12, 00),
  ),
  Event(
    'Booking 3',
    DateTime(2023, 11, 2, 13, 00),
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  final _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final selectedDayTimeString = DateFormat('MMM d, EEE').format(_selectedDay);
    return Scaffold(
      appBar: AppBar(
        title: const TitleLargeText('Plannable Booking'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                final widgetWidth = context.size?.width;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(
                        child: BodyLargeText(selectedDayTimeString),
                      ),
                      content: SizedBox(
                        width: widgetWidth!,
                        child: TableCalendarWidget(
                          focusedDay: DateTime.now(),
                          onDaySelected: (day) {},
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const BodyMediumText('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: BodyLargeText(selectedDayTimeString),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AnimatedEventList(events: mocking),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
