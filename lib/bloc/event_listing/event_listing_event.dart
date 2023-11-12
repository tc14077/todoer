part of 'event_listing_bloc.dart';

@immutable
sealed class EventListingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class _InitialLoadRequested extends EventListingEvent {}
