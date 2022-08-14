import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/app_theme/app_theme_cubit.dart';
import 'package:todoer/enum/app_theme_options.dart';
import 'package:todoer/navigation/beamer/main_router.dart';
import 'package:todoer/ui/system/themes.dart';

import 'bloc/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
        ),
        BlocProvider<BottomNavBarCubit>(
          create: (context) => BottomNavBarCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<AppThemeCubit, AppThemeOption>(
            builder: (context, state) {
              return MaterialApp.router(
                key: key,
                routeInformationParser: BeamerParser(
                  onParse: (p0) {
                    log('BeamerParser: ${p0.location}');
                    return p0;
                  },
                ),
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.themeMode,
                routerDelegate: BeamerMainRouter.routerDelegate,
                backButtonDispatcher: BeamerMainRouter.backButtonDispatcher,
              );
            },
          );
        },
      ),
    );
  }
}
