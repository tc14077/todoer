import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/event_create/event_create_bloc.dart';
import 'package:todoer/ui/widget/booking_detail_widget.dart';

import '../system/themed_text.dart';

class CreateBookingScreen extends StatelessWidget {
  const CreateBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventCreateBloc>(
      create: (context) => EventCreateBloc(),
      child: Builder(
        builder: (providerContext) => Scaffold(
          appBar: AppBar(
            title: const TitleLargeText('Create Booking'),
            actions: [
              TextButton(
                onPressed: () {},
                child: const BodyMediumText('Save'),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<EventCreateBloc, EventCreateState>(
              builder: (context, state) {
                if (state is EventDataUpdateSuccess) {
                  return BookingDetailWidget(
                    defaultBookingTime: DateTime.now(),
                    name: state.name,
                    remark: state.remark,
                    selectedDate: state.selectedDate,
                    selectedTime: state.selectedTime,
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
