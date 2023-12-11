import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/ui/widget/booking_detail/booking_detail_widget.dart';

import '../../../bloc/event_create/event_create_bloc.dart';

class CreateBookingWidget extends BookingDetailWidget {
  const CreateBookingWidget({
    super.key,
    required super.defaultBookingTime,
    required super.selectedDate,
    required super.selectedTime,
    required super.inviteePairList,
    super.bookingName,
    super.remark,
    super.errors,
    super.inviteeFormErrors,
  });

  @override
  void onBookingNameChanged(BuildContext context, String name) {
    context.read<EventCreateBloc>().add(EventDataUpdateRequested(name: name));
  }

  @override
  void onDateChanged(BuildContext context, DateTime dateTime) {
    context
        .read<EventCreateBloc>()
        .add(EventDataUpdateRequested(selectedDate: dateTime));
  }

  @override
  void onInviteeInfoChanged(
      BuildContext context, String hashId, String name, String phoneNumber) {
    context.read<EventCreateBloc>().add(InviteeDataUpdateRequested(
          hashId: hashId,
          name: name,
          phoneNumber: phoneNumber,
        ));
  }

  @override
  void onRemarkChanged(BuildContext context, String remark) {
    context
        .read<EventCreateBloc>()
        .add(EventDataUpdateRequested(remark: remark));
  }

  @override
  void onTimeChanged(BuildContext context, TimeOfDay timeOfDay) {
    context
        .read<EventCreateBloc>()
        .add(EventDataUpdateRequested(selectedTime: timeOfDay));
  }
}
