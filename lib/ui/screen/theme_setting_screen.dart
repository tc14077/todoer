import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/app_theme/app_theme_cubit.dart';
import '../../enum/app_theme_options.dart';
import '../system/themed_text.dart';

class ThemeSettingScreen extends StatefulWidget {
  const ThemeSettingScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSettingScreen> createState() => _ThemeSettingScreenState();
}

class _ThemeSettingScreenState extends State<ThemeSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeOptions = AppThemeOption.values
        .map((e) => ThemeCard(
              appThemeOption: e,
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme setting'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleLargeText('Themes'),
            ...themeOptions,
          ],
        ),
      ),
    );
  }
}

class ThemeCard extends StatelessWidget {
  final AppThemeOption appThemeOption;
  const ThemeCard({
    Key? key,
    required this.appThemeOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyLargeText(appThemeOption.displayName),
            ],
          ),
        ),
      ),
      onTap: () {
        if (appThemeOption != AppThemeOption.dark &&
            appThemeOption != AppThemeOption.light) {
          return;
        }
        if (appThemeOption != context.read<AppThemeCubit>().state) {
          context.read<AppThemeCubit>().toggleTheme();
        }
      },
    );
  }
}
