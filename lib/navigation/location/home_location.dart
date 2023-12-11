import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';
import 'package:todoer/ui/screen/edit_booking_screen.dart';

import '../../ui/screen/create_booking_screen.dart';
import '../../ui/screen/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPath.editBooking, '${AppPath.home}/*'];

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
        BeamPage(
          key: const ValueKey('createBooking'),
          child: CreateBookingScreen(),
        ),
      );
    }
    if (state.pathPatternSegments.contains('editBooking')) {
      pages.add(
        BeamPage(
          key: const ValueKey('editBooking'),
          child: EditBookingScreen(
            eventId: int.parse(
              state.pathParameters['eventId']!,
            ),
          ),
        ),
      );
    }
    return pages;
  }
}
