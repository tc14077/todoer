import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../location/main_location.dart';

class BeamerMainRouter {
  static final beamerKey = GlobalKey<BeamerState>();
  static final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        MainLocation(),
      ],
    ),
  );
  static final BeamerBackButtonDispatcher backButtonDispatcher =
      BeamerBackButtonDispatcher(delegate: routerDelegate);
}
