import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';
import 'package:todoer/ui/screen/main_screen.dart';

class MainLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${AppPath.MAIN}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
        key: const ValueKey('main'),
        child: MainScreen(),
      ),
    ];
    return pages;
  }
}
