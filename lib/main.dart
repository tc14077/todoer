import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:todoer/navigation/location/beam_locations.dart';
import 'package:todoer/navigation/location/main_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        MainLocation(),
      ],
    ),
  );

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _beamerListener;
  final GlobalKey key = GlobalKey();
  @override
  void initState() {
    super.initState();
    _beamerListener = () {
      final currentBeamLocation = ((key.currentState?.widget as MaterialApp)
              .routerDelegate as BeamerDelegate)
          .currentBeamLocation;
      final beamState = currentBeamLocation.state;
      String currentUri = "";
      currentUri = (beamState as BeamState).uriBlueprint.path;
      print('uriBlueprint: $currentUri');
    };
    widget.routerDelegate.addListener(_beamerListener);
  }

  @override
  void dispose() {
    widget.routerDelegate.removeListener(_beamerListener);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: key,
      routeInformationParser: BeamerParser(
        onParse: (p0) {
          log('BeamerParser: ${p0.location}');
          return p0;
        },
      ),
      routerDelegate: widget.routerDelegate,
    );
  }
}
