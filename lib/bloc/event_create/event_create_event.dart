part of 'event_create_bloc.dart';

sealed class EventCreateEvent extends Equatable {
  const EventCreateEvent();

  @override
  List<Object?> get props => [];
}

final class InitializeRequested extends EventCreateEvent {}

final class EventDataUpdateRequested extends EventCreateEvent {
  final String? name;
  final String? remark;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final InviteePair? inviteePair;

  const EventDataUpdateRequested({
    this.name,
    this.remark,
    this.selectedDate,
    this.selectedTime,
    this.inviteePair,
  });

  @override
  List<Object?> get props => [
        name,
        remark,
        selectedDate,
        selectedTime,
        inviteePair,
      ];
}

final class InviteeDataUpdateRequested extends EventCreateEvent {
  final String hashId;
  final String? name;
  final String? phoneNumber;
  final String? countryCode;

  const InviteeDataUpdateRequested({
    required this.hashId,
    this.name,
    this.countryCode,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        hashId,
        name,
        countryCode,
        phoneNumber,
      ];
}

final class EventCreateRequested extends EventCreateEvent {
  const EventCreateRequested();
}
