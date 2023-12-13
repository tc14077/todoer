import 'package:flutter/material.dart';
import 'package:todoer/enum/event_form_error.dart';

import '../../system/themed_text.dart';

class InviteeForm extends StatefulWidget {
  const InviteeForm({
    super.key,
    this.inviteeName,
    this.inviteeCountryCode,
    this.inviteePhoneNumber,
    this.eventFormError,
    required this.onInviteeInfoUpdate,
  });

  final String? inviteeName;
  final String? inviteeCountryCode;
  final String? inviteePhoneNumber;
  final Set<EventFormError>? eventFormError;

  final Function(
    String inviteeName,
    String countryCode,
    String phoneNumber,
  ) onInviteeInfoUpdate;

  @override
  State<InviteeForm> createState() => _InviteeFormState();
}

class _InviteeFormState extends State<InviteeForm> {
  late final TextEditingController _inviteeNameController;
  late final TextEditingController _inviteePhoneNumberController;
  late final TextEditingController _inviteeCountryCodeController;

  final _nameFieldKey = UniqueKey();
  final _phoneNumberKey = UniqueKey();
  final _countryCodeKey = UniqueKey();

  @override
  void initState() {
    _inviteeNameController = TextEditingController(text: widget.inviteeName);
    _inviteePhoneNumberController = TextEditingController(
      text: widget.inviteePhoneNumber,
    );
    _inviteeCountryCodeController = TextEditingController(
      text: widget.inviteeCountryCode,
    );
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
              _inviteeCountryCodeController.text,
              _inviteePhoneNumberController.text,
            );
          },
        ),
        Row(
          children: [
            Flexible(
              flex: 3,
              child: TextField(
                key: _countryCodeKey,
                controller: _inviteeCountryCodeController,
                decoration: const InputDecoration(
                  labelText: 'Country Code',
                ),
                onChanged: (value) {
                  widget.onInviteeInfoUpdate(
                    _inviteeNameController.text,
                    value,
                    _inviteePhoneNumberController.text,
                  );
                },
              ),
            ),
            const SizedBox.square(
              dimension: 8.0,
            ),
            Flexible(
              flex: 7,
              child: TextField(
                key: _phoneNumberKey,
                controller: _inviteePhoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  widget.onInviteeInfoUpdate(
                    _inviteeNameController.text,
                    _inviteeCountryCodeController.text,
                    value,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
