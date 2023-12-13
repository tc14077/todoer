import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/enum/event_form_error.dart';
import 'package:todoer/ui/system/themed_text.dart';

import '../../../bloc/model/invitee_form_record.dart';
import 'invitee_form.dart';

part 'date_time_picker_field.dart';

abstract class BookingFormInterface {
  void onBookingNameChanged(
    BuildContext context,
    String name,
  );

  void onRemarkChanged(
    BuildContext context,
    String remark,
  );

  void onDateChanged(
    BuildContext context,
    DateTime dateTime,
  );

  void onTimeChanged(
    BuildContext context,
    TimeOfDay timeOfDay,
  );

  void onInviteeInfoChanged(
    BuildContext context,
    String hashId,
    String name,
    String countryCode,
    String phoneNumber,
  );
}

abstract class BookingDetailWidget extends StatefulWidget
    implements BookingFormInterface {
  const BookingDetailWidget({
    super.key,
    required this.defaultBookingTime,
    required this.selectedDate,
    required this.selectedTime,
    required this.inviteePairList,
    this.bookingName,
    this.remark,
    this.errors,
    this.inviteeFormErrors,
  });
  final String? bookingName;
  final String? remark;

  final DateTime defaultBookingTime;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final List<InviteePair> inviteePairList;
  final Set<EventFormError>? errors;
  final Map<String, Set<EventFormError>>? inviteeFormErrors;

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  late final TextEditingController _eventNameController;
  late final TextEditingController _eventRemarkController;
  final nameFieldKey = UniqueKey();
  final remarkFieldKey = UniqueKey();

  @override
  void initState() {
    _eventNameController = TextEditingController(text: widget.bookingName);
    _eventRemarkController = TextEditingController(text: widget.remark);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BookingDetailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final inviteeFormList = widget.inviteePairList.map((pair) => InviteeForm(
          key: ValueKey(pair.hashId),
          inviteeName: pair.record.inviteeName ?? '',
          inviteePhoneNumber: pair.record.inviteePhoneNumber ?? '',
          inviteeCountryCode: pair.record.inviteeCountryCode,
          eventFormError: widget.inviteeFormErrors?[pair.hashId],
          onInviteeInfoUpdate: (name, countryCode, phoneNumber) {
            widget.onInviteeInfoChanged(
              context,
              pair.hashId,
              name,
              countryCode,
              phoneNumber,
            );
          },
        ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleLargeText('Booking Detail'),
        TextField(
          key: nameFieldKey,
          controller: _eventNameController,
          decoration: InputDecoration(
            labelText: 'Booking Name',
            errorText:
                widget.errors?.contains(EventFormError.nameNotFound) == true
                    ? 'This field is required'
                    : null,
          ),
          onChanged: (value) => widget.onBookingNameChanged(context, value),
        ),
        TextField(
          key: remarkFieldKey,
          controller: _eventRemarkController,
          decoration: const InputDecoration(
            labelText: 'Remark (Optional)',
          ),
          onChanged: (value) => widget.onRemarkChanged(context, value),
        ),
        DateTimePickerField(
          onDateUpdate: (date) {
            if (date != null) {
              widget.onDateChanged(context, date);
            }
          },
          onTimeUpdate: (time) {
            if (time != null) {
              widget.onTimeChanged(context, time);
            }
          },
          pickedDate: widget.selectedDate,
          pickedTime: widget.selectedTime,
        ),
        const SizedBox.square(
          dimension: 12,
        ),
        ...inviteeFormList,
      ],
    );
  }
}
