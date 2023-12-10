import 'package:flutter/material.dart';

import '../../system/themed_text.dart';

class InviteeForm extends StatelessWidget {
  InviteeForm({
    super.key,
    String? inviteeName,
    String? inviteePhoneNumber,
    required this.onInviteeInfoUpdate,
  })  : _inviteeNameController = TextEditingController(text: inviteeName),
        _inviteePhoneNumberController =
            TextEditingController(text: inviteePhoneNumber);

  final TextEditingController _inviteeNameController;
  final TextEditingController _inviteePhoneNumberController;
  final Function(String inviteeName, String phoneNumber) onInviteeInfoUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleLargeText('Invitee'),
        TextField(
          controller: _inviteeNameController,
          decoration: const InputDecoration(
            labelText: 'Invitee Name',
          ),
          onChanged: (value) {
            onInviteeInfoUpdate(value, _inviteePhoneNumberController.text);
          },
        ),
        TextField(
          controller: _inviteePhoneNumberController,
          decoration: const InputDecoration(
            labelText: 'Contact Number',
          ),
          onChanged: (value) {
            onInviteeInfoUpdate(_inviteeNameController.text, value);
          },
        ),
      ],
    );
  }
}