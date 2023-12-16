import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/ui/system/themed_text.dart';

import '../../bloc/event_listing/event_listing_bloc.dart';
import '../../main.dart';
import '../../repositories/event_repository.dart';
import '../../repositories/invitee_repository.dart';
import '../widget/table_calendar_widget.dart';

class CalendarViewScreen extends StatelessWidget {
  const CalendarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventListingBloc>(
          create: (context) => EventListingBloc(
            eventRepository: getIt<EventRepository>(),
            inviteeRepository: getIt<InviteeRepository>(),
          ),
        ),
      ],
      child: const CalendarViewWidget(),
    );
  }
}

class CalendarViewWidget extends StatefulWidget {
  const CalendarViewWidget({super.key});

  @override
  State<CalendarViewWidget> createState() => _CalendarViewWidgetState();
}

class _CalendarViewWidgetState extends State<CalendarViewWidget> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleLargeText('Plannable Booking'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<EventListingBloc, EventListingState>(
          builder: (context, state) {
            return switch (state) {
              EventsLoadInProgress() => const Center(
                  child: CircularProgressIndicator(),
                ),
              EventsLoadSuccess(eventDisplayItemMap: var itemMap) => ListView(
                  shrinkWrap: true,
                  children: [
                    TableCalendarWidget(
                      eventDisplayItemMap: itemMap,
                      focusedDay: selectedDay,
                      onDaySelected: (day) {
                        selectedDay = day;
                        setState(() {});
                      },
                    ),
                  ],
                ),
            };
          },
        ),
      ),
    );
  }
}
