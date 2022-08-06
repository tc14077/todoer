import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/location/beam_locations.dart';
import 'package:todoer/navigation/path/app_path.dart';

import '../../navigation/beamer/main_beamer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Beamer(
        key: BeamerMain.beamerKey,
        routerDelegate: BeamerMain.routerDelegate,
        backButtonDispatcher: BeamerMain.backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        beamerKey: BeamerMain.beamerKey,
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = _beamerDelegate.currentBeamLocation is HomeLocation ? 0 : 1;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
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
          _beamerDelegate.beamToNamed(AppPath.home);
          return;
        }
        if (index == 1) {
          _beamerDelegate.beamToNamed(AppPath.settings);
          return;
        }
      },
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
