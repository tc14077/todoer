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

  //TODO find out how to pass the control to child
  static final BeamerBackButtonDispatcher backButtonDispatcher =
      BeamerBackButtonDispatcher(
    delegate: routerDelegate,
  );
}
