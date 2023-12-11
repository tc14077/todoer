import 'package:flutter/material.dart';
import 'package:todoer/enum/event_form_error.dart';

import '../../system/themed_text.dart';

class InviteeForm extends StatefulWidget {
  const InviteeForm({
    super.key,
    this.inviteeName,
    this.inviteePhoneNumber,
    this.eventFormError,
    required this.onInviteeInfoUpdate,
  });

  final String? inviteeName;
  final String? inviteePhoneNumber;
  final Set<EventFormError>? eventFormError;

  final Function(String inviteeName, String phoneNumber) onInviteeInfoUpdate;

  @override
  State<InviteeForm> createState() => _InviteeFormState();
}

class _InviteeFormState extends State<InviteeForm> {
  late final TextEditingController _inviteeNameController;
  late final TextEditingController _inviteePhoneNumberController;

  final _nameFieldKey = UniqueKey();
  final _phoneNumberKey = UniqueKey();

  @override
  void initState() {
    _inviteeNameController = TextEditingController(text: widget.inviteeName);
    _inviteePhoneNumberController =
        TextEditingController(text: widget.inviteePhoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleLargeText('Invitee'),
        TextField(
          key: _nameFieldKey,
          controller: _inviteeNameController,
          decoration: InputDecoration(
            labelText: 'Invitee Name',
            errorText: widget.eventFormError
                        ?.contains(EventFormError.defaultInviteeNameNotFound) ==
                    true
                ? 'This field is required'
                : null,
          ),
          onChanged: (value) {
            widget.onInviteeInfoUpdate(
              value,
              _inviteePhoneNumberController.text,
            );
          },
        ),
        TextField(
          key: _phoneNumberKey,
          controller: _inviteePhoneNumberController,
          decoration: const InputDecoration(
            labelText: 'Contact Number',
          ),
          onChanged: (value) {
            widget.onInviteeInfoUpdate(
              _inviteeNameController.text,
              value,
            );
          },
        ),
      ],
    );
  }
}
