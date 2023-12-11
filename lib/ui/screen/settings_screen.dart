import 'package:flutter/material.dart';
import 'package:todoer/navigation/beamer/main_beamer.dart';

import '../../enum/general_setting_item.dart';
import '../system/themed_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingItems = GeneralSettingItem.values
        .map((item) => ListTile(
              leading: item.buildIcon(),
              title: BodyMediumText(item.displayName),
              onTap: () => BeamerMain.beamerKey.currentState?.routerDelegate
                  .beamToNamed(item.appPath),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleLargeText('General'),
            const SizedBox(
              height: 10,
            ),
            ListView(
              children: settingItems,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
