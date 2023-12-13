import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';
import 'package:todoer/ui/screen/theme_setting_screen.dart';

import '../../ui/screen/settings_screen.dart';

class SettingsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${AppPath.settings}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('settings'),
        child: SettingsScreen(title: 'Settings'),
      ),
    ];

    if (state.pathPatternSegments.contains(AppPath.appTheme.split('/').last)) {
      pages.add(const BeamPage(
        key: ValueKey('theme_setting'),
        child: ThemeSettingScreen(),
      ));
    }
    return pages;
  }
}
