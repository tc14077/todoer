import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/ui/system/themed_text.dart';

import '../../data/database/app_database.dart';
import 'invitee_indicator.dart';

/// Displays the event item on a Card together with DateTime information
///
/// This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    this.onTap,
    required this.animation,
    required this.event,
    this.invitees,
  });

  final Animation<double> animation;
  final VoidCallback? onTap;
  final Event event;
  final List<Invitee>? invitees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 80),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyMediumText(
                      DateFormat('hh:mm').format(event.happenedAt),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox.square(dimension: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyMediumText(event.name),
                        const Spacer(),
                        InviteeIndicator(numberOfInvitee: invitees?.length,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
