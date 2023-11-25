import 'package:flutter/material.dart';
import 'package:todoer/data/display_items/displayable.dart';
import 'package:todoer/ui/system/themed_text.dart';

import 'event_card.dart';
import 'model/list_model.dart';

class AnimatedFullEventList extends StatelessWidget {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Map<DateDisplayItem, List<EventDisplayItem>> eventMap;
  late final ListModel<Displayable> _list;

  AnimatedFullEventList({
    super.key,
    required this.eventMap,
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
    final item =  _list[index];
    return switch(item){
      EventDisplayItem(event: var event, invitees: var invitees) => EventCard(
      animation: animation,
      event: event,
      invitees: invitees,
      onTap: () {},
      // No gesture detector here: we don't want removed items to be interactive.
    ),
    DateDisplayItem(dateTime: var dateTime) => BodyMediumText(dateTime.toString())
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
    return switch(item){
      EventDisplayItem(event: var event, invitees: var invitees) => EventCard(
      animation: animation,
      event: event,
      invitees: invitees,
      // No gesture detector here: we don't want removed items to be interactive.
    ),
    DateDisplayItem(dateTime: var dateTime) => BodyMediumText(dateTime.toString())
    };
  }
}
