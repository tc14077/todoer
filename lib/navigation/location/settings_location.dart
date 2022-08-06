import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';

import '../../ui/screen/settings_screen.dart';

class SettingsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${AppPath.settings}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('settings'),
        child: SettingsScreen(title: 'Settings Screen'),
      ),
    ];
    return pages;
  }
}
