import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:todoer/navigation/location/beam_locations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation(),
        SecondLocation(),
      ],
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(
        onParse: (p0) {
          log('BeamerParser: ${p0.toString()}');
          return p0;
        },
      ),
      routerDelegate: routerDelegate,
    );
  }
}
