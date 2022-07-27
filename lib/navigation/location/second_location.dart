import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';

import '../../ui/screen/home_screen.dart';

class SecondLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['${AppPath.SECOND}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('second'),
        child: HomeScreen(title: 'Second Location'),
      ),
    ];
    return pages;
  }
}
