import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../navigation/path/app_path.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({
    Key? key,
    required int currentIndex,
    required BeamerDelegate beamerDelegate,
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
    return BottomNavigationBar(
      currentIndex: widget._currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
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
          widget._beamerDelegate.beamToNamed(AppPath.settings);
          return;
        }
      },
    );
  }
}
