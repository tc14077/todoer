import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'event_create_event.dart';
part 'event_create_state.dart';
part 'invitee_form_record.dart';

typedef InviteePair = ({String hashId, InviteeFormRecord record});

class EventCreateBloc extends Bloc<EventCreateEvent, EventCreateState> {
  String? name;
  String? remark;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  final Map<String, InviteeFormRecord> inviteeFormRecordMap = {};
  List<InviteePair> get inviteeRecordList => inviteeFormRecordMap.entries
      .map((e) => (hashId: e.key, record: e.value))
      .toList();

  EventCreateBloc() : super(EventCreateInitializeInProgress()) {
    on<InitializeRequested>(_onInitializeRequested);
    on<EventDataUpdateRequested>(_onEventDataUpdateRequested);

    add(InitializeRequested());
  }

  void _onInitializeRequested(
    InitializeRequested event,
    Emitter<EventCreateState> emit,
  ) {
    final now = DateTime.now();
    selectedDate = now;
    selectedTime = TimeOfDay.fromDateTime(now);
    final initialInviteeUUID = const Uuid().v4();
    inviteeFormRecordMap[initialInviteeUUID] = const InviteeFormRecord();
    emit(EventDataUpdateSuccess(
      name: name,
      remark: remark,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      inviteePairList: inviteeRecordList,
    ));
  }

  void _onEventDataUpdateRequested(
    EventDataUpdateRequested event,
    Emitter<EventCreateState> emit,
  ) {
    selectedDate = event.selectedDate ?? selectedDate;
    selectedTime = event.selectedTime ?? selectedTime;
    name = event.name ?? name;
    remark = event.remark ?? remark;
    emit(EventDataUpdateSuccess(
      name: name,
      remark: remark,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      inviteePairList: inviteeRecordList,
    ));
  }
}
