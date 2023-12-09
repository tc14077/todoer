part of 'event_create_bloc.dart';

sealed class EventCreateState extends Equatable {
  const EventCreateState();

  @override
  List<Object?> get props => [];
}

final class EventCreateInitializeInProgress extends EventCreateState {}

final class EventDataUpdateSuccess extends EventCreateState {
  final String? name;
  final String? remark;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final List<InviteePair> inviteePairList;

  const EventDataUpdateSuccess({
    required this.name,
    required this.remark,
    required this.selectedDate,
    required this.selectedTime,
    required this.inviteePairList,
  });

  @override
  List<Object?> get props => [
        name,
        remark,
        selectedDate,
        selectedTime,
        inviteePairList,
      ];
}
