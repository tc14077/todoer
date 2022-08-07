import 'package:flutter/material.dart';

class GeneralSettingItem {
  final String displayName;
  final String appPath;
  final Widget? icon;

  GeneralSettingItem({
    required this.displayName,
    required this.appPath,
    this.icon,
  });
}
