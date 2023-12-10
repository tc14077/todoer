import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/data/database/app_database.dart';
import 'package:todoer/repositories/event_repository.dart';
import 'package:todoer/repositories/invitee_repository.dart';

import '../../data/display_items/displayable.dart';

part 'event_listing_event.dart';
part 'event_listing_state.dart';

class EventListingBloc extends Bloc<EventListingEvent, EventListingState> {
  final EventRepository eventRepository;
  final InviteeRepository inviteeRepository;
  late final StreamSubscription _eventTableSubscription;
  EventListingBloc({
    required this.eventRepository,
    required this.inviteeRepository,
  }) : super(EventsLoadInProgress()) {
    on<_InitialLoadRequested>(_onInitialLoadRequested);
    on<_TableUpdated>(_onTableUpdated);
    on<EventDeleteRequested>(_onEventDeleteRequested);
    add(_InitialLoadRequested());
    _eventTableSubscription =
        eventRepository.getAllItemsAsStream().listen((events) {
      add(_TableUpdated(events: events));
    });
  }

  FutureOr<void> _onInitialLoadRequested(
    _InitialLoadRequested event,
    Emitter<EventListingState> emit,
  ) async {
    final events = await eventRepository.getAllItems();
    Map<DateDisplayItem, List<EventDisplayItem>> itemMap =
        await _getItemMap(events);

    emit(EventsLoadSuccess(eventDisplayItemMap: itemMap));
  }

  Future<Map<DateDisplayItem, List<EventDisplayItem>>> _getItemMap(
      List<Event> events) async {
    final List<EventDisplayItem> eventDisplayItems = [];

    for (final event in events) {
      final invitees = await inviteeRepository.getInviteesInEvent(event: event);
      eventDisplayItems.add(EventDisplayItem(event, invitees: invitees));
    }

    eventDisplayItems.sort();

    final itemMap = eventDisplayItems.groupListsBy<DateDisplayItem>((item) {
      return DateDisplayItem(
          dateTime: DateUtils.dateOnly(item.event.happenedAt));
    });
    return itemMap;
  }

  void _onTableUpdated(
    _TableUpdated event,
    Emitter<EventListingState> emit,
  ) async {
    Map<DateDisplayItem, List<EventDisplayItem>> itemMap =
        await _getItemMap(event.events);

    emit(EventsLoadSuccess(eventDisplayItemMap: itemMap));
  }

  @override
  Future<void> close() {
    _eventTableSubscription.cancel();
    return super.close();
  }

  void _onEventDeleteRequested(
    EventDeleteRequested event,
    Emitter<EventListingState> emit,
  ) async {
    await eventRepository.deleteItemById(event.eventId);
  }
}
