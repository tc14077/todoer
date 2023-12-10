import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/event_create/event_create_bloc.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';
import 'package:todoer/ui/widget/booking_detail/booking_detail_widget.dart';

import '../../main.dart';
import '../system/themed_text.dart';

class CreateBookingScreen extends StatelessWidget {
  CreateBookingScreen({super.key});
  final bookingDetailWidgetKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventCreateBloc>(
      create: (context) => EventCreateBloc(
        eventRepository: getIt<EventRepository>(),
        inviteeRepository: getIt<InviteeRepository>(),
      ),
      child: Builder(
        builder: (providerContext) => Scaffold(
          appBar: AppBar(
            title: const TitleLargeText('Create Booking'),
            actions: [
              BlocBuilder<EventCreateBloc, EventCreateState>(
                builder: (context, state) {
                  if (state is EventCreateInProgress) {
                    return const CircularProgressIndicator();
                  }
                  return TextButton(
                    onPressed: () {
                      providerContext
                          .read<EventCreateBloc>()
                          .add(const EventCreateRequested());
                    },
                    child: const BodyMediumText('Save'),
                  );
                },
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<EventCreateBloc, EventCreateState>(
              buildWhen: (previous, current) =>
                  current is EventDataUpdateSuccess ||
                  current is EventCreateFailure,
              listener: (context, state) {
                if (state is EventCreateSuccess) {
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
                if (state is EventCreateFailure) {
                  return BookingDetailWidget(
                    key: bookingDetailWidgetKey,
                    defaultBookingTime: DateTime.now(),
                    bookingName: state.name,
                    remark: state.remark,
                    selectedDate: state.selectedDate,
                    selectedTime: state.selectedTime,
                    inviteePairList: state.inviteePairList,
                    errors: state.errors,
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
