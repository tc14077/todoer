import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/app_theme/app_theme_cubit.dart';
import 'package:todoer/navigation/beamer/main_beamer.dart';

import '../../enum/general_setting_items.dart';
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
    final settingItems = GeneralSettingItems.values
        .map((item) => ListTile(
              leading: item.model.icon,
              title: BodyMediumText(item.model.displayName),
              onTap: () => BeamerMain.beamerKey.currentState?.routerDelegate
                  .beamToNamed(item.model.appPath),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.dark_mode),
        tooltip: 'change_theme',
        onPressed: () {
          context.read<AppThemeCubit>().toggleTheme();
        },
      ),
    );
  }
}
