import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoer/bloc/event_create/event_create_bloc.dart';
import 'package:todoer/enum/event_form_error.dart';
import 'package:todoer/ui/system/themed_text.dart';

import 'invitee_form.dart';

part 'date_time_picker_field.dart';

class BookingDetailWidget extends StatefulWidget {
  const BookingDetailWidget({
    super.key,
    required this.defaultBookingTime,
    required this.selectedDate,
    required this.selectedTime,
    required this.inviteePairList,
    this.bookingName,
    this.remark,
    this.errors,
  });
  final String? bookingName;
  final String? remark;

  final DateTime defaultBookingTime;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final List<InviteePair> inviteePairList;
  final Set<EventFormError>? errors;

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  late final TextEditingController _eventNameController;
  late final TextEditingController _eventRemarkController;
  final nameFieldKey = UniqueKey();
  final remarkFieldKey = UniqueKey();

  @override
  void initState() {
    _eventNameController = TextEditingController(text: widget.bookingName);
    _eventRemarkController = TextEditingController(text: widget.remark);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BookingDetailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final inviteeFormList = widget.inviteePairList.map((pair) => InviteeForm(
          key: ValueKey(pair.hashId),
          inviteeName: pair.record.inviteeName ?? '',
          inviteePhoneNumber: pair.record.inviteePhoneNumber ?? '',
          onInviteeInfoUpdate: (name, phoneNumber) {
            context.read<EventCreateBloc>().add(InviteeDataUpdateRequested(
                  hashId: pair.hashId,
                  name: name,
                  phoneNumber: phoneNumber,
                ));
          },
        ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleLargeText('Booking Detail'),
        TextField(
          key: nameFieldKey,
          controller: _eventNameController,
          decoration: InputDecoration(
            labelText: 'Booking Name',
            errorText:
                widget.errors?.contains(EventFormError.nameNotFound) == true
                    ? 'This field is required'
                    : null,
          ),
          onChanged: (value) => context
              .read<EventCreateBloc>()
              .add(EventDataUpdateRequested(name: value)),
        ),
        TextField(
          key: remarkFieldKey,
          controller: _eventRemarkController,
          decoration: const InputDecoration(
            labelText: 'Remark (Optional)',
          ),
          onChanged: (value) => context
              .read<EventCreateBloc>()
              .add(EventDataUpdateRequested(remark: value)),
        ),
        DateTimePickerField(
          onDateUpdate: (date) {
            context
                .read<EventCreateBloc>()
                .add(EventDataUpdateRequested(selectedDate: date));
          },
          onTimeUpdate: (time) {
            context
                .read<EventCreateBloc>()
                .add(EventDataUpdateRequested(selectedTime: time));
          },
          pickedDate: widget.selectedDate,
          pickedTime: widget.selectedTime,
        ),
        const SizedBox.square(
          dimension: 12,
        ),
        ...inviteeFormList,
      ],
    );
  }
}
