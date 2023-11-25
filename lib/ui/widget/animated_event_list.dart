import 'package:flutter/material.dart';

import '../../data/display_items/displayable.dart';
import 'event_card.dart';

class AnimatedEventList extends StatelessWidget {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<EventDisplayItem> events;
  late final ListModel<EventDisplayItem> _list;

  AnimatedEventList({
    super.key,
    required this.events,
  }) {
    _list = ListModel<EventDisplayItem>(
      listKey: _listKey,
      removedItemBuilder: _buildRemovedItem,
      initialItems: events,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final item =  _list[index];
    return EventCard(
      animation: animation,
      event: item.event,
      invitees: item.invitees,
      onTap: () {},
    );
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
    EventDisplayItem item,
    BuildContext context,
    Animation<double> animation,
  ) {
    return EventCard(
      animation: animation,
      event: item.event,
      invitees: item.invitees,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }
}
