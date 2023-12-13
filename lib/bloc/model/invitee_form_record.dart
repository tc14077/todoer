import 'package:equatable/equatable.dart';

typedef InviteePair = ({String hashId, InviteeFormRecord record});

class InviteeFormRecord extends Equatable {
  final String? inviteeName;
  final String? inviteeCountryCode;
  final String? inviteePhoneNumber;

  const InviteeFormRecord({
    this.inviteeName,
    this.inviteeCountryCode,
    this.inviteePhoneNumber,
  });

  @override
  List<Object?> get props =>
      [inviteeName, inviteeCountryCode, inviteePhoneNumber];

  InviteeFormRecord copyWith({
    String? inviteeName,
    String? inviteeCountryCode,
    String? inviteePhoneNumber,
  }) {
    return InviteeFormRecord(
      inviteeName: inviteeName,
      inviteeCountryCode: inviteeCountryCode,
      inviteePhoneNumber: inviteePhoneNumber,
    );
  }
}
