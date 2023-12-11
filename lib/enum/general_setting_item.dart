import 'package:flutter/material.dart';
import 'package:todoer/navigation/path/app_path.dart';

enum GeneralSettingItem {
  appTheme(
    appPath: AppPath.appTheme,
    displayName: 'Themes',
  );

  final String displayName;
  final String appPath;

  const GeneralSettingItem({
    required this.displayName,
    required this.appPath,
  });

  Widget buildIcon({String? iconPath}) {
    switch (this) {
      case appTheme:
        return const Icon(Icons.dark_mode);
      default:
        return iconPath == null
            ? const SizedBox.shrink()
            : Image.asset(iconPath);
    }
  }
}
