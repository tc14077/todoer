import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/event_edit/event_edit_bloc.dart';
import 'package:todoer/ui/widget/booking_detail/booking_detail_widget.dart';

class EditBookingWidget extends BookingDetailWidget {
  const EditBookingWidget({
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
    context.read<EventEditBloc>().add(EventDataUpdateRequested(name: name));
  }

  @override
  void onDateChanged(BuildContext context, DateTime dateTime) {
    context
        .read<EventEditBloc>()
        .add(EventDataUpdateRequested(selectedDate: dateTime));
  }

  @override
  void onInviteeInfoChanged(
      BuildContext context, String hashId, String name, String phoneNumber) {
    context.read<EventEditBloc>().add(InviteeDataUpdateRequested(
          hashId: hashId,
          name: name,
          phoneNumber: phoneNumber,
        ));
  }

  @override
  void onRemarkChanged(BuildContext context, String remark) {
    context.read<EventEditBloc>().add(EventDataUpdateRequested(remark: remark));
  }

  @override
  void onTimeChanged(BuildContext context, TimeOfDay timeOfDay) {
    context
        .read<EventEditBloc>()
        .add(EventDataUpdateRequested(selectedTime: timeOfDay));
  }
}
