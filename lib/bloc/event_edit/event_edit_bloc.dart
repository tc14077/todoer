import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoer/bloc/mixins/invitee_records_validator.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../enum/event_form_error.dart';
import '../../repositories/event_repository.dart';
import '../../repositories/invitee_repository.dart';
import '../model/invitee_form_record.dart';

part 'event_edit_event.dart';
part 'event_edit_state.dart';

class EventEditBloc extends Bloc<EventEditEvent, EventEditState>
    with InviteeRecordsValidator {
  final int eventId;
  late String name;
  String? remark;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  final Map<String, InviteeFormRecord> inviteeFormRecordMap = {};
  final Map<String, int> inviteeRecordIdMap = {};
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
    for (var invitee in invitees) {
      final hashId = const Uuid().v4();
      inviteeFormRecordMap[hashId] = InviteeFormRecord(
        inviteeName: invitee.name,
        inviteeCountryCode: invitee.countryCode,
        inviteePhoneNumber: invitee.phoneNumber,
      );
      inviteeRecordIdMap[hashId] = invitee.id;
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
      inviteeName: event.name,
      inviteeCountryCode: event.countryCode,
      inviteePhoneNumber: event.phoneNumber,
    );
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
  ) async {
    emit(EventEditInProgress());
    final happenedAt = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    final inviteeRecordValidateResult =
        validateInviteeRecords(inviteeFormRecordMap)
          ..removeWhere((key, value) => value.isEmpty);

    if (name == '' || inviteeRecordValidateResult.isNotEmpty) {
      final errors = {
        if (name == '') EventFormError.nameNotFound,
      };

      emit(EventEditFailure(
        name: name,
        remark: remark,
        selectedDate: selectedDate,
        selectedTime: selectedTime,
        inviteePairList: inviteeRecordList,
        errors: errors,
        inviteeFormErrors: inviteeRecordValidateResult,
      ));
      return;
    }

    await eventRepository.updateItem(
      eventId,
      EventsCompanion(
        name: Value(name),
        remark: Value(remark),
        happenedAt: Value(happenedAt),
      ),
    );

    for (var inviteeDbRecord in inviteeRecordIdMap.entries) {
      final inviteeRecord = inviteeFormRecordMap[inviteeDbRecord.key];
      final inviteeId = inviteeDbRecord.value;
      if (inviteeRecord == null) {
        await inviteeRepository.deleteItemById(inviteeId);
      } else {
        await inviteeRepository.updateItem(
          inviteeId,
          InviteesCompanion(
            name: Value(inviteeRecord.inviteeName!),
            countryCode: Value(inviteeRecord.inviteeCountryCode),
            phoneNumber: Value(inviteeRecord.inviteePhoneNumber),
          ),
        );
      }
    }

    emit(EventEditSuccess());
  }
}
