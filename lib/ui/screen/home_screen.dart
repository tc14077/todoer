import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/event_listing/event_listing_bloc.dart';
import 'package:todoer/main.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';
import 'package:todoer/ui/system/themed_text.dart';
import 'package:todoer/ui/widget/animated_full_event_list.dart';

import '../../navigation/path/app_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

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
      child: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleLargeText('Plannable Booking'),
        actions: [
          IconButton(
            onPressed: () {
              context.beamToNamed(AppPath.createBooking);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<EventListingBloc, EventListingState>(
          builder: (context, state) {
            return switch (state) {
              EventsLoadInProgress() => const Center(
                  child: CircularProgressIndicator(),
                ),
              EventsLoadSuccess(eventDisplayItemMap: var itemMap) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AnimatedFullEventList(
                          eventMap: itemMap,
                          onDeleteEventRequested: (eventId) {
                            context
                                .read<EventListingBloc>()
                                .add(EventDeleteRequested(eventId: eventId));
                          },
                        ),
                      ),
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
