part of 'event_edit_bloc.dart';

sealed class EventEditEvent extends Equatable {
  const EventEditEvent();

  @override
  List<Object?> get props => [];
}

final class _InitializeRequested extends EventEditEvent {}

final class EventDataUpdateRequested extends EventEditEvent {
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

final class InviteeDataUpdateRequested extends EventEditEvent {
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

final class EventEditRequested extends EventEditEvent {
  const EventEditRequested();
}
