import 'package:flutter/material.dart';
import 'package:todoer/ui/screen/home_screen.dart';
import 'package:todoer/ui/system/themed_text.dart';

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
  });

  final Animation<double> animation;
  final VoidCallback? onTap;
  final Event event;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              child: Center(
                child: BodyMediumText(event.name),
              ),
            ),
          ),
        ),
      ),
    );
  }
}