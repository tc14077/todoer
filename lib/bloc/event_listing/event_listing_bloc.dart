import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoer/data/display_items/event_display_item.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';

part 'event_listing_event.dart';
part 'event_listing_state.dart';

class EventListingBloc extends Bloc<EventListingEvent, EventListingState> {
  final EventRepository eventRepository;
  final InviteeRepository inviteeRepository;
  EventListingBloc({
    required DateTime initialDate,
    required this.eventRepository,
    required this.inviteeRepository,
  }) : super(EventListingInitial()) {
    on<_InitialLoadRequested>(_onInitialLoadRequested);
  }

  FutureOr<void> _onInitialLoadRequested(
    _InitialLoadRequested event,
    Emitter<EventListingState> emit,
  ) async {
    final events = await eventRepository.getAllItems();
    final List<EventDisplayItem> eventDisplayItems = [];
    
    for(final event in events){
      final invitees = await inviteeRepository.getInviteesInEvent(event: event);
      eventDisplayItems.add(EventDisplayItem(event, invitees: invitees));
    }
     emit(EventsLoadSuccess(eventDisplayItems: eventDisplayItems));
  }
}
