import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoer/data/display_items/displayable.dart';
import 'package:todoer/main.dart';
import 'package:todoer/services/prefill_text_helper.dart';
import 'package:todoer/services/whatsapp_helper.dart';
import 'package:todoer/ui/system/themed_text.dart';

import 'contact_with_whatsapp_dialog.dart';
import 'event_card.dart';
import 'model/list_model.dart';

class AnimatedFullEventList extends StatelessWidget {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Map<DateDisplayItem, List<EventDisplayItem>> eventMap;
  late final ListModel<Displayable> _list;
  final Function(int eventId) onDeleteEventRequested;
  final Function(int eventId) onEventCardTap;

  AnimatedFullEventList({
    super.key,
    required this.eventMap,
    required this.onDeleteEventRequested,
    required this.onEventCardTap,
  }) {
    final List<Displayable> displayableItems = [];
    eventMap.forEach((key, value) {
      displayableItems.add(key);
      displayableItems.addAll(value);
    });
    _list = ListModel<Displayable>(
      listKey: _listKey,
      removedItemBuilder: _buildRemovedItem,
      initialItems: displayableItems,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final item = _list[index];
    return switch (item) {
      EventDisplayItem(event: var event, invitees: var invitees) => EventCard(
          animation: animation,
          event: event,
          invitees: invitees,
          contactName: invitees?.firstOrNull?.name,
          contactNumber: invitees?.firstOrNull?.phoneNumber,
          countryCode: invitees?.firstOrNull?.countryCode,
          onTap: () {
            onEventCardTap(event.id);
          },
          onContactNumberTap: (contactName, countryCode, contactNumber) async {
            showDialog(
              context: context,
              builder: (context) {
                return ContactWithWhatsAppDialog(
                  contactName: invitees?.firstOrNull?.name ?? '',
                  onContactWithWhatsAppTap: () async {
                    await getIt<WhatsappHelperImpl>().launchWhatsapp(
                      countryCode: countryCode,
                      phoneNumber: contactNumber,
                    );
                  },
                  onContactWithConfirmationMessageWithWhatsAppTap: () async {
                    await getIt<WhatsappHelperImpl>().launchWhatsapp(
                      countryCode: countryCode,
                      phoneNumber: contactNumber,
                      prefillText: getIt<PrefillTextHelperImpl>()
                          .getBookingConfirmationMessage(
                        event: event,
                        contactName: contactName,
                        invitees: invitees,
                      ),
                    );
                  },
                  onCancelTap: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
          onDeleteButtonTap: (eventId) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: TitleMediumText('Wanna delete '),
                        ),
                        WidgetSpan(
                          child: TitleMediumText(
                            event.name,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const WidgetSpan(
                          child: TitleMediumText('?'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          onDeleteEventRequested(eventId);
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.redAccent.shade100,
                          ),
                        ),
                        child: LabelMediumText(
                          'Delete',
                          textColor: Colors.redAccent.shade100,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        child: const LabelMediumText(
                          'Cancel',
                          textColor: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      DateDisplayItem(dateTime: var dateTime) =>
        TitleMediumText(DateFormat('dd/MM/yyyy').format(dateTime))
    };
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _list.length,
      itemBuilder: _buildItem,
    );
  }

  /// The builder function used to build items that have been removed.
  ///
  /// Used to build an item after it has been removed from the list. This method
  /// is needed because a removed item remains visible until its animation has
  /// completed (even though it's gone as far as this ListModel is concerned).
  /// The widget will be used by the [AnimatedListState.removeItem] method's
  /// [AnimatedRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
    Displayable item,
    BuildContext context,
    Animation<double> animation,
  ) {
    return switch (item) {
      EventDisplayItem(event: var event, invitees: var invitees) => EventCard(
          animation: animation,
          event: event,
          invitees: invitees,
          // No gesture detector here: we don't want removed items to be interactive.
        ),
      DateDisplayItem(dateTime: var dateTime) =>
        BodyMediumText(dateTime.toString())
    };
  }
}
