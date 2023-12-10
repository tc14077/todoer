import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoer/repositories/invitee_repository.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../enum/event_form_error.dart';
import '../../repositories/event_repository.dart';

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

  final EventRepository eventRepository;
  final InviteeRepository inviteeRepository;

  EventCreateBloc({
    required this.eventRepository,
    required this.inviteeRepository,
  }) : super(EventCreateInitializeInProgress()) {
    on<InitializeRequested>(_onInitializeRequested);
    on<EventDataUpdateRequested>(_onEventDataUpdateRequested);
    on<InviteeDataUpdateRequested>(_onInviteeDataUpdateRequested);
    on<EventCreateRequested>(_onEventCreateRequested);

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
    // emit(EventDataUpdateSuccess(
    //   name: name,
    //   remark: remark,
    //   selectedDate: selectedDate,
    //   selectedTime: selectedTime,
    //   inviteePairList: inviteeRecordList,
    // ));
  }

  void _onInviteeDataUpdateRequested(
    InviteeDataUpdateRequested event,
    Emitter<EventCreateState> emit,
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

  _onEventCreateRequested(
    EventCreateRequested event,
    Emitter<EventCreateState> emit,
  ) async {
    emit(EventCreateInProgress());
    final happenedAt = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    final inviteeRecordValidateResult = _validateInviteeRecords()..removeWhere((key, value) => value.isEmpty);

    if (name == null ||
        name == '' ||
        inviteeRecordValidateResult.isNotEmpty) {
      final errors = {
        if (name == null || name == '') EventFormError.nameNotFound,
      };

      emit(EventCreateFailure(
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

    final itemId = await eventRepository.createItem(EventsCompanion(
      name: Value(name!),
      remark: Value(remark),
      happenedAt: Value(happenedAt),
    ));

    final inviteeId = await inviteeRepository.createItem(InviteesCompanion(
      name: Value(inviteeFormRecordMap.entries.first.value.inviteeName ?? ''),
      event: Value(itemId),
      phoneNumber: Value(
        inviteeFormRecordMap.entries.first.value.inviteePhoneNumber,
      ),
    ));
    emit(EventCreateSuccess());
  }

  Map<String, Set<EventFormError>> _validateInviteeRecords() {
    return inviteeFormRecordMap.map((key, value) {
      final errors = {
        if (value.inviteeName == null || value.inviteeName == '')
          EventFormError.defaultInviteeNameNotFound,
      };
      return MapEntry(key, errors);
    });
  }
}
