import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoer/ui/system/themed_text.dart';

import 'invitee_form.dart';

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
        const TitleLargeText('Booking Detail'),
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
        DateTimePicker(
          dateController: _eventNameController,
          defaultBookingTime: defaultBookingTime,
        ),
        const SizedBox.square(
          dimension: 12,
        ),
        InviteeForm(
          inviteeName: 'Tom',
          inviteePhoneNumber: '91466915',
          onInviteeInfoUpdate: (name, phoneNumber) {
            print('$name, $phoneNumber');
          },
        ),
      ],
    );
  }
}

class DateTimePicker extends StatelessWidget {
  DateTimePicker({
    super.key,
    required TextEditingController dateController,
    required this.defaultBookingTime,
  }) : _dateController = dateController;

  final TextEditingController _dateController;
  final DateTime defaultBookingTime;
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Booking Date',
              suffixIcon: Icon(Icons.calendar_month),
            ),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: defaultBookingTime,
                firstDate: today.subtract(const Duration(days: 1)),
                lastDate: today.add(const Duration(days: 365)),
                currentDate: today,
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
            controller: _dateController,
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
    );
  }
}
