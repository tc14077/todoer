part of 'event_listing_bloc.dart';

@immutable
sealed class EventListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class EventsLoadInProgress extends EventListingState {}

final class EventsLoadSuccess extends EventListingState {
  final Map<DateDisplayItem, List<EventDisplayItem>> eventDisplayItemMap;

  EventsLoadSuccess({required this.eventDisplayItemMap});

  @override
  List<Object?> get props => [eventDisplayItemMap];
}
