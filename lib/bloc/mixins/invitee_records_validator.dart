import '../../enum/event_form_error.dart';
import '../model/invitee_form_record.dart';

mixin InviteeRecordsValidator {
  Map<String, Set<EventFormError>> validateInviteeRecords(
      Map<String, InviteeFormRecord> inviteeFormRecordMap) {
    return inviteeFormRecordMap.map((key, value) {
      final errors = {
        if (value.inviteeName == null || value.inviteeName == '')
          EventFormError.defaultInviteeNameNotFound,
      };
      return MapEntry(key, errors);
    });
  }
}
