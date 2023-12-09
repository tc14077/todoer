part of 'event_create_bloc.dart';

class InviteeFormRecord extends Equatable {
  final String? inviteeName;
  final String? inviteePhoneNumber;

  const InviteeFormRecord({
    this.inviteeName,
    this.inviteePhoneNumber,
  });

  @override
  List<Object?> get props => [inviteeName, inviteePhoneNumber];

  InviteeFormRecord copyWith({
    String? inviteeName,
    String? inviteePhoneNumber,
  }) {
    return InviteeFormRecord(
      inviteeName: inviteeName,
      inviteePhoneNumber: inviteePhoneNumber,
    );
  }
}
