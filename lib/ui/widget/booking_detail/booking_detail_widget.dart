import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/ui/system/themed_text.dart';

import 'invitee_form.dart';

class BookingDetailWidget extends StatelessWidget {
  BookingDetailWidget({
    super.key,
    required this.defaultBookingTime,
    required this.selectedDate,
    required this.selectedTime,
    String? name,
    String? remark,
  })  : _eventNameController = TextEditingController(text: name),
        _eventRemarkController = TextEditingController(text: remark),
        _eventDateController = TextEditingController(
            text: DateFormat('dd/MM/yyyy').format(selectedDate)),
        _eventTimeController = TextEditingController(
            text: DateFormat('HH:mm').format(
                DateTime(0, 1, 1, selectedTime.hour, selectedTime.minute)));

  final TextEditingController _eventNameController;
  final TextEditingController _eventRemarkController;
  final TextEditingController _eventDateController;
  final TextEditingController _eventTimeController;
  final DateTime defaultBookingTime;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  @override
  Widget build(BuildContext context) {
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
          controller: _eventRemarkController,
          decoration: const InputDecoration(
            labelText: 'Remark (Optional)',
          ),
        ),
        DateTimePicker(
          dateController: _eventDateController,
          timeController: _eventTimeController,
          onDateUpdate: (date) {},
          onTimeUpdate: (time) {},
          pickedDate: selectedDate,
          pickedTime: selectedTime,
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
    required TextEditingController timeController,
    required this.onDateUpdate,
    required this.onTimeUpdate,
    required this.pickedDate,
    required this.pickedTime,
  })  : _dateController = dateController,
        _timeController = timeController;

  final TextEditingController _dateController;
  final TextEditingController _timeController;
  final Function(DateTime? date) onDateUpdate;
  final Function(TimeOfDay? time) onTimeUpdate;
  final DateTime pickedDate;
  final TimeOfDay pickedTime;
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
                initialDate: pickedDate,
                firstDate: today.subtract(const Duration(days: 1)),
                lastDate: today.add(const Duration(days: 365)),
                currentDate: today,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDatePickerMode: DatePickerMode.day,
              );
              onDateUpdate(date);
            },
          ),
        ),
        const SizedBox.square(
          dimension: 8.0,
        ),
        Flexible(
          flex: 1,
          child: TextField(
            controller: _timeController,
            decoration: const InputDecoration(
              labelText: 'Booking Time',
              suffixIcon: Icon(Icons.alarm),
            ),
            readOnly: true,
            onTap: () async {
              final selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                  hour: pickedTime.hour,
                  minute: pickedTime.minute,
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
              onTimeUpdate(selectedTime);
            },
          ),
        ),
      ],
    );
  }
}
