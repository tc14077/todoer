import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/ui/system/themed_text.dart';

import '../../data/database/app_database.dart';

/// Displays the event item on a Card together with DateTime information
///
/// This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    this.onTap,
    this.onDeleteButtonTap,
    required this.animation,
    required this.event,
    this.invitees,
    this.contactName,
    this.contactNumber,
  });

  final Animation<double> animation;
  final VoidCallback? onTap;
  final Function(int eventId)? onDeleteButtonTap;
  final Event event;
  final List<Invitee>? invitees;
  final String? contactName;
  final String? contactNumber;

  @override
  Widget build(BuildContext context) {
    String? contactString;
    if (contactName != null && contactNumber != null) {
      contactString = '👤$contactName, 📞$contactNumber';
    } else if (contactName != null) {
      contactString = '👤$contactName';
    } else if (contactNumber != null) {
      contactString = '📞$contactNumber';
    }

    final numberOfInvitees = invitees?.length.toString() ?? '?';

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
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyMediumText(
                          '${DateFormat('dd/MM, HH:mm').format(event.happenedAt)} , $contactString',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox.square(dimension: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyMediumText(
                                    '${event.name} x $numberOfInvitees'),
                                if (event.remark != null)
                                  BodyMediumText('${event.remark}'),
                                // if (contactString != null)
                                //   BodyMediumText(contactString),
                              ],
                            ),
                            // FIXME: remove this spacer
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () => onDeleteButtonTap?.call(event.id),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
