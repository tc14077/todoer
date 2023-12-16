part of 'event_edit_bloc.dart';

sealed class EventEditState extends Equatable {
  const EventEditState();

  @override
  List<Object?> get props => [];
}

final class EventEditInitializeInProgress extends EventEditState {}

final class EventDataState extends EventEditState {
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

final class EventEditInProgress extends EventEditState {}

final class EventEditSuccess extends EventEditState {}

final class EventEditFailure extends EventDataState {
  final Set<EventFormError> errors;
  final Map<String, Set<EventFormError>> inviteeFormErrors;

  const EventEditFailure({
    required super.name,
    required super.remark,
    required super.selectedDate,
    required super.selectedTime,
    required super.inviteePairList,
    required this.errors,
    required this.inviteeFormErrors,
  });

  @override
  List<Object?> get props => [
        name,
        remark,
        selectedDate,
        selectedTime,
        inviteePairList,
        errors,
        inviteeFormErrors,
      ];
}
