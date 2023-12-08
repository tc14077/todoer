import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';

import '../../ui/screen/create_booking_screen.dart';
import '../../ui/screen/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${AppPath.home}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('home'),
        child: HomeScreen(title: 'Home Location'),
      ),
    ];
    if (state.pathPatternSegments.contains('createBooking')) {
      pages.add(
        const BeamPage(
          key: ValueKey('createBooking'),
          child: CreateBookingScreen(),
        ),
      );
    }
    return pages;
  }
}
