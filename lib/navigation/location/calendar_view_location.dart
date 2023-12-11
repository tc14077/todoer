import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';
import 'package:todoer/ui/screen/calendar_view_screen.dart';

class CalendarViewLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${AppPath.calendarView}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('calendar'),
        child: CalendarViewScreen(),
      ),
    ];
    // if (state.pathPatternSegments.contains('createBooking')) {
    //   pages.add(
    //     BeamPage(
    //       key: const ValueKey('createBooking'),
    //       child: CreateBookingScreen(),
    //     ),
    //   );
    // }
    // if (state.pathPatternSegments.contains('editBooking')) {
    //   pages.add(
    //     BeamPage(
    //       key: const ValueKey('editBooking'),
    //       child: EditBookingScreen(
    //         eventId: int.parse(
    //           state.pathParameters['eventId']!,
    //         ),
    //       ),
    //     ),
    //   );
    // }
    return pages;
  }
}
