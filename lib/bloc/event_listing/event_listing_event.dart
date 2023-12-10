part of 'event_listing_bloc.dart';

@immutable
sealed class EventListingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class _InitialLoadRequested extends EventListingEvent {}

class _TableUpdated extends EventListingEvent {
  final List<Event> events;

  _TableUpdated({required this.events});

  @override
  List<Object?> get props => [events];
}
