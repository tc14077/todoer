import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'ui/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '/': (context, state, data) => const HomeScreen(title: 'HomeScreen'),
        '/screen_1': (context, state, data) =>
            const HomeScreen(title: 'screen_1'),
      },
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
