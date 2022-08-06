import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:todoer/navigation/beamer/main_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Function() _beamerListener;
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
      // TODO use logger
      // print('uriBlueprint: $currentUri');
    };
    BeamerMainRouter.routerDelegate.addListener(_beamerListener);
  }

  @override
  void dispose() {
    BeamerMainRouter.routerDelegate.removeListener(_beamerListener);
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
      routerDelegate: BeamerMainRouter.routerDelegate,
      backButtonDispatcher: BeamerMainRouter.backButtonDispatcher,
    );
  }
}
