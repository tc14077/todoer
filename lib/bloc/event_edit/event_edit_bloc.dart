import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../enum/event_form_error.dart';
import '../../repositories/event_repository.dart';
import '../../repositories/invitee_repository.dart';
import '../model/invitee_form_record.dart';

part 'event_edit_event.dart';
part 'event_edit_state.dart';

class EventEditBloc extends Bloc<EventEditEvent, EventEditState> {
  final int eventId;
  late String name;
  String? remark;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  final Map<String, InviteeFormRecord> inviteeFormRecordMap = {};
  List<InviteePair> get inviteeRecordList => inviteeFormRecordMap.entries
      .map((e) => (hashId: e.key, record: e.value))
      .toList();

  final EventRepository eventRepository;
  final InviteeRepository inviteeRepository;
  EventEditBloc({
    required this.eventId,
    required this.eventRepository,
    required this.inviteeRepository,
  }) : super(EventEditInitializeInProgress()) {
    on<_InitializeRequested>(_onInitializeRequested);
    on<EventDataUpdateRequested>(_onEventDataUpdateRequested);
    on<InviteeDataUpdateRequested>(_onInviteeDataUpdateRequested);
    on<EventEditRequested>(_onEventEditRequested);

    add(_InitializeRequested());
  }

  void _onInitializeRequested(
    _InitializeRequested event,
    Emitter<EventEditState> emit,
  ) async {
    final event = await eventRepository.getItemById(eventId);
    if (event == null) {
      return;
    }
    name = event.name;
    remark = event.remark;
    selectedDate = event.happenedAt;
    selectedTime = TimeOfDay.fromDateTime(selectedDate);
    final invitees = await inviteeRepository.getInviteesInEvent(event: event);
    final inviteeRecords = invitees.map((e) => InviteeFormRecord(
          inviteeName: e.name,
          inviteePhoneNumber: e.phoneNumber,
        ));
    for (var element in inviteeRecords) {
      final hashId = const Uuid().v4();
      inviteeFormRecordMap[hashId] = element;
    }
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
    Emitter<EventEditState> emit,
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

  void _onInviteeDataUpdateRequested(
    InviteeDataUpdateRequested event,
    Emitter<EventEditState> emit,
  ) {
    final newRecord = inviteeFormRecordMap[event.hashId]?.copyWith(
        inviteeName: event.name, inviteePhoneNumber: event.phoneNumber);
    if (newRecord != null) inviteeFormRecordMap[event.hashId] = newRecord;
    //TODO fix hashId not found case
    emit(EventDataUpdateSuccess(
      name: name,
      remark: remark,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      inviteePairList: inviteeRecordList,
    ));
  }

  void _onEventEditRequested(
    EventEditRequested event,
    Emitter<EventEditState> emit,
  ) {}
}
