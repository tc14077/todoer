import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';

import '../../data/display_items/displayable.dart';

part 'event_listing_event.dart';
part 'event_listing_state.dart';

class EventListingBloc extends Bloc<EventListingEvent, EventListingState> {
  final EventRepository eventRepository;
  final InviteeRepository inviteeRepository;
  EventListingBloc({
    required this.eventRepository,
    required this.inviteeRepository,
  }) : super(EventsLoadInProgress()) {
    on<_InitialLoadRequested>(_onInitialLoadRequested);
    add(_InitialLoadRequested());
  }

  FutureOr<void> _onInitialLoadRequested(
    _InitialLoadRequested event,
    Emitter<EventListingState> emit,
  ) async {
    final events = await eventRepository.getAllItems();
    final List<EventDisplayItem> eventDisplayItems = [];

    for (final event in events) {
      final invitees = await inviteeRepository.getInviteesInEvent(event: event);
      eventDisplayItems.add(EventDisplayItem(event, invitees: invitees));
    }

    eventDisplayItems.sort();

    final itemMap = eventDisplayItems.groupListsBy<DateDisplayItem>((item){
      return DateDisplayItem(dateTime: DateUtils.dateOnly(item.event.happenedAt));
    });

    emit(EventsLoadSuccess(eventDisplayItemMap: itemMap));
  }
}
