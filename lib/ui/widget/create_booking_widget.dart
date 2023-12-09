import 'package:flutter/material.dart';
import 'package:todoer/ui/system/themed_text.dart';

class CreateBookingWidget extends StatelessWidget {
  CreateBookingWidget({
    super.key,
    required this.defaultBookingTime,
  });

  final TextEditingController _eventNameController = TextEditingController();
  final DateTime defaultBookingTime;

  @override
  Widget build(BuildContext context) {
    // ElevatedButton(
    //       child: const BodyMediumText('Cancel'),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _eventNameController,
          decoration: const InputDecoration(
            labelText: 'Booking Name',
          ),
        ),
        TextField(
          controller: _eventNameController,
          decoration: const InputDecoration(
            labelText: 'Remark (Optional)',
          ),
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextField(
                controller: _eventNameController,
                decoration: const InputDecoration(
                  labelText: 'Booking Date',
                  suffixIcon: Icon(Icons.calendar_month),
                ),
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: defaultBookingTime,
                    firstDate: DateTime.now().subtract(const Duration(days: 1)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    initialDatePickerMode: DatePickerMode.day,
                  );
                  print(date);
                },
              ),
            ),
            const SizedBox.square(
              dimension: 8.0,
            ),
            Flexible(
              flex: 1,
              child: TextField(
                controller: _eventNameController,
                decoration: const InputDecoration(
                  labelText: 'Booking Time',
                  suffixIcon: Icon(Icons.alarm),
                ),
                readOnly: true,
                onTap: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                      hour: defaultBookingTime.hour,
                      minute: defaultBookingTime.minute,
                    ),
                    initialEntryMode: TimePickerEntryMode.inputOnly,
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child!,
                      );
                    },
                  );
                  print(selectedTime);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
