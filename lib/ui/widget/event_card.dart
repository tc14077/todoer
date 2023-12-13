import 'package:flutter/gestures.dart';
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
    this.onContactNumberTap,
    required this.animation,
    required this.event,
    this.invitees,
    this.contactName,
    this.contactNumber,
    this.countryCode,
  });

  final Animation<double> animation;
  final VoidCallback? onTap;
  final Function(int eventId)? onDeleteButtonTap;
  final Function(
    String contactName,
    String countryCode,
    String contactNumber,
  )? onContactNumberTap;
  final Event event;
  final List<Invitee>? invitees;
  final String? contactName;
  final String? contactNumber;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BodyMediumText(
                              DateFormat('dd/MM, HH:mm')
                                  .format(event.happenedAt),
                              textAlign: TextAlign.left,
                            ),
                            _ContactString(
                              contactName: contactName,
                              contactNumber: contactNumber,
                              onContactNumberTap: onContactNumberTap,
                              countryCode: countryCode,
                            ),
                          ],
                        ),
                        const SizedBox.square(dimension: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyMediumText(event.name),
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

class _ContactString extends StatelessWidget {
  const _ContactString({
    this.contactName,
    this.countryCode,
    this.contactNumber,
    this.onContactNumberTap,
  });

  final String? contactName;
  final String? contactNumber;
  final String? countryCode;
  final Function(
    String contactName,
    String countryCode,
    String contactNumber,
  )? onContactNumberTap;

  @override
  Widget build(BuildContext context) {
    TextSpan? contactNameWidgetSpan;
    TextSpan? contactNumberTextSpan;
    final _countryCode = countryCode;
    final _phoneNumber = contactNumber;
    if (contactName != null) {
      contactNameWidgetSpan = TextSpan(
        text: ', $contactName',
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }
    if (_phoneNumber != null &&
        _phoneNumber.isNotEmpty &&
        _countryCode != null) {
      contactNumberTextSpan = TextSpan(
        text: ', ',
        children: [
          TextSpan(
            text: _phoneNumber,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.blue,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                onContactNumberTap?.call(
                  contactName ?? '',
                  _countryCode,
                  _phoneNumber,
                );
              },
          ),
        ],
      );
    }
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          if (contactNameWidgetSpan != null) contactNameWidgetSpan,
          if (contactNumberTextSpan != null) contactNumberTextSpan,
        ],
      ),
    );
  }
}
