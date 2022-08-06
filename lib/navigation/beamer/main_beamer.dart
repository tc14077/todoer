import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/beamer/main_router.dart';

import '../location/beam_locations.dart';

class BeamerMain {
  static final beamerKey = GlobalKey<BeamerState>();

  static final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation(),
        SettingsLocation(),
      ],
    ),
  );
  static final BeamerChildBackButtonDispatcher backButtonDispatcher =
      BeamerChildBackButtonDispatcher(
    parent: BeamerMainRouter.backButtonDispatcher,
    delegate: routerDelegate,
    onBack: (delegate) async {
      print('BeamerMain onBack');
      return false;
    },
  );
}
