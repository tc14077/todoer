import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/bloc/app_theme/app_theme_cubit.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: HeadlineMediumText(
          widget.title,
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
