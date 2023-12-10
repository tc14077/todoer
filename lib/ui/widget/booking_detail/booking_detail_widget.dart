import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/ui/system/themed_text.dart';

import 'invitee_form.dart';

part 'date_time_picker_field.dart';

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
        DateTimePickerField(
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
