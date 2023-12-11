import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';
import 'package:todoer/ui/widget/booking_detail/booking_detail_widget.dart';

import '../../bloc/event_edit/event_edit_bloc.dart';
import '../../main.dart';
import '../system/themed_text.dart';

class EditBookingScreen extends StatelessWidget {
  EditBookingScreen({super.key, required this.eventId});

  final bookingDetailWidgetKey = UniqueKey();
  final int eventId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventEditBloc>(
      create: (context) => EventEditBloc(
        eventRepository: getIt<EventRepository>(),
        inviteeRepository: getIt<InviteeRepository>(),
        eventId: eventId,
      ),
      child: Builder(
        builder: (providerContext) => Scaffold(
          appBar: AppBar(
            title: const TitleLargeText('Edit Booking'),
            actions: [
              BlocBuilder<EventEditBloc, EventEditState>(
                builder: (context, state) {
                  if (state is EventEditInProgress) {
                    return const CircularProgressIndicator();
                  }
                  return TextButton(
                    onPressed: () {
                      providerContext
                          .read<EventEditBloc>()
                          .add(const EventEditRequested());
                    },
                    child: const BodyMediumText('Save'),
                  );
                },
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<EventEditBloc, EventEditState>(
              buildWhen: (previous, current) =>
                  current is EventDataUpdateSuccess ||
                  current is EventEditFailure,
              listener: (context, state) {
                if (state is EventEditSuccess) {
                  context.beamBack();
                }
              },
              builder: (context, state) {
                if (state is EventDataUpdateSuccess) {
                  return BookingDetailWidget(
                    key: bookingDetailWidgetKey,
                    defaultBookingTime: DateTime.now(),
                    bookingName: state.name,
                    remark: state.remark,
                    selectedDate: state.selectedDate,
                    selectedTime: state.selectedTime,
                    inviteePairList: state.inviteePairList,
                  );
                }
                if (state is EventEditFailure) {
                  return BookingDetailWidget(
                    key: bookingDetailWidgetKey,
                    defaultBookingTime: DateTime.now(),
                    bookingName: state.name,
                    remark: state.remark,
                    selectedDate: state.selectedDate,
                    selectedTime: state.selectedTime,
                    inviteePairList: state.inviteePairList,
                    errors: state.errors,
                    inviteeFormErrors: state.inviteeFormErrors,
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
