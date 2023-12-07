import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/event_listing/event_listing_bloc.dart';
import 'package:todoer/main.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';
import 'package:todoer/ui/system/themed_text.dart';
import 'package:todoer/ui/widget/animated_full_event_list.dart';

import '../../data/database/app_database.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventListingBloc>(
      create: (context) => EventListingBloc(
        eventRepository: getIt<EventRepository>(),
        inviteeRepository: getIt<InviteeRepository>(),
      ),
      child: HomeWidget(),
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
      ),
      floatingActionButton: IconButton(
          onPressed: () async {
            final eventRepo = getIt<EventRepository>();
            final inviteeRepo = getIt<InviteeRepository>();
            // await eventRepo.deleteAllItems();
            // await inviteeRepo.deleteAllItems();
            final itemId = await eventRepo.createItem(EventsCompanion(
              name: const Value('First Appointment'),
              happenedAt: Value(
                DateTime.now()
                  ..add(
                    const Duration(days: 1, hours: 1),
                  ),
              ),
            ));
            final inviteeId = await inviteeRepo.createItem(InviteesCompanion(
              name: const Value('Tom'),
              event: Value(itemId),
              phoneNumber: const Value('91466915'),
            ));
            print('eventId: $itemId, inviteeId: $inviteeId');
          },
          icon: const Icon(
            Icons.add,
          )),
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
                        child: AnimatedFullEventList(eventMap: itemMap),
                      ),
                    ),
                  ],
                )
            };
          },
        ),
      ),
    );
  }
}
