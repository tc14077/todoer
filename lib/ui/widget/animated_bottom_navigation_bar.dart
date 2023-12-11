import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../navigation/path/app_path.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  final bool needShowing;
  const AnimatedBottomNavigationBar({
    Key? key,
    required int currentIndex,
    required BeamerDelegate beamerDelegate,
    required this.needShowing,
  })  : _currentIndex = currentIndex,
        _beamerDelegate = beamerDelegate,
        super(key: key);

  final int _currentIndex;
  final BeamerDelegate _beamerDelegate;

  @override
  State<AnimatedBottomNavigationBar> createState() =>
      _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final double dy = widget.needShowing ? 0 : 1;
    return AnimatedSlide(
      offset: Offset(0, dy),
      duration: const Duration(milliseconds: 70),
      child: BottomNavigationBar(
        currentIndex: widget._currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar View',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        onTap: (index) {
          if (index == 0) {
            widget._beamerDelegate.beamToNamed(AppPath.home);
            return;
          }
          if (index == 1) {
            widget._beamerDelegate.beamToNamed(AppPath.calendarView);
            return;
          }
          if (index == 2) {
            widget._beamerDelegate.beamToNamed(AppPath.settings);
            return;
          }
        },
      ),
    );
  }
}
