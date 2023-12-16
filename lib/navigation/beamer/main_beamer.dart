import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/beamer/main_router.dart';
import 'package:todoer/navigation/path/app_path.dart';

import '../location/beam_locations.dart';
import '../location/calendar_view_location.dart';

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
        CalendarViewLocation(),
        SettingsLocation(),
      ],
    ),
  );
  static final BeamerChildBackButtonDispatcher backButtonDispatcher =
      BeamerChildBackButtonDispatcher(
    parent: BeamerMainRouter.backButtonDispatcher,
    delegate: routerDelegate,
    onBack: (delegate) async {
      final currentBeamLocation = delegate.currentBeamLocation;
      final beamState = currentBeamLocation.state;
      final currentUri = (beamState as BeamState).uriBlueprint.path;
      if (currentUri == AppPath.home ||
          currentUri == AppPath.settings ||
          currentUri == AppPath.calendarView) {
        return true;
      }
      return false;
    },
  );
}
