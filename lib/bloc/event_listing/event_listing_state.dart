part of 'event_listing_bloc.dart';

@immutable
sealed class EventListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class EventsLoadInProgress extends EventListingState {}

final class EventsLoadSuccess extends EventListingState {
  final List<EventDisplayItem> eventDisplayItems;

  EventsLoadSuccess({required this.eventDisplayItems});

  @override
  List<Object?> get props => [eventDisplayItems];
}
