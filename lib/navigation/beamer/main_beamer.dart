import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/beamer/main_router.dart';

import '../location/beam_locations.dart';

class BeamerMain {
  static final beamerKey = GlobalKey<BeamerState>();

  static final routerDelegate = BeamerDelegate(
    routeListener: (info, delegate) {
      final currentBeamLocation = delegate.currentBeamLocation;
      final beamState = currentBeamLocation.state;
      final currentUri = (beamState as BeamState).uriBlueprint.path;
      print('BeamerMain-uriBlueprint: $currentUri');
    },
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
      if (delegate.currentBeamLocation is HomeLocation ||
          delegate.currentBeamLocation is SettingsLocation) {
        return true;
      }
      return false;
    },
  );
}
