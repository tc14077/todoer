part of 'event_create_bloc.dart';

sealed class EventCreateState extends Equatable {
  const EventCreateState();

  @override
  List<Object?> get props => [];
}

final class EventCreateInitializeInProgress extends EventCreateState {}

final class EventDataState extends EventCreateState {
  final String? name;
  final String? remark;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final List<InviteePair> inviteePairList;

  const EventDataState({
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

final class EventDataUpdateSuccess extends EventDataState {
  const EventDataUpdateSuccess({
    required super.name,
    required super.remark,
    required super.selectedDate,
    required super.selectedTime,
    required super.inviteePairList,
  });
}

final class EventCreateInProgress extends EventCreateState {}

final class EventCreateSuccess extends EventCreateState {}

final class EventCreateFailure extends EventDataState {
  final Set<EventFormError> errors;

  const EventCreateFailure({
    required super.name,
    required super.remark,
    required super.selectedDate,
    required super.selectedTime,
    required super.inviteePairList,
    required this.errors,
  });

  @override
  List<Object?> get props => [
        name,
        remark,
        selectedDate,
        selectedTime,
        inviteePairList,
        errors,
      ];
}
