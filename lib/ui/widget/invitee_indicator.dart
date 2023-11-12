import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:todoer/ui/system/themed_text.dart';

// TODO make the badge to be a perfect square
class InviteeIndicator extends StatelessWidget {
  final int? numberOfInvitee;

  const InviteeIndicator({super.key, this.numberOfInvitee});
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: Colors.lightBlue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
      ),
      badgeAnimation: const badges.BadgeAnimation.fade(
        animationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
      ),
      badgeContent: numberOfInvitee == null || numberOfInvitee == 0
          ? const Icon(
              Icons.question_mark,
              size: 10,
            )
          : SizedBox.square(
            child: LabelSmallText(
              numberOfInvitee.toString(),
              textAlign: TextAlign.center,
            ),
          ),
      child: const Icon(Icons.people_outline),
    );
  }
}
