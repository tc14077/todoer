import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoer/bloc/event_create/event_create_bloc.dart';
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
        _eventRemarkController = TextEditingController(text: remark);

  final TextEditingController _eventNameController;
  final TextEditingController _eventRemarkController;
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
          onChanged: (value) => context.read<EventCreateBloc>().add(EventDataUpdateRequested(name: value)),
        ),
        TextField(
          controller: _eventRemarkController,
          decoration: const InputDecoration(
            labelText: 'Remark (Optional)',
          ),
          onChanged: (value) => context.read<EventCreateBloc>().add(EventDataUpdateRequested(remark: value)),
        ),
        DateTimePickerField(
          onDateUpdate: (date) {
            context.read<EventCreateBloc>().add(EventDataUpdateRequested(selectedDate: date));
          },
          onTimeUpdate: (time) {
             context.read<EventCreateBloc>().add(EventDataUpdateRequested(selectedTime: time));
          },
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
