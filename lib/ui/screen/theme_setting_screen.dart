import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoer/ui/animation_mask/icon_appearance_mask.dart';
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
            BlocBuilder<AppThemeCubit, AppThemeOption>(
              builder: (context, state) {
                return ThemeOptionsWidget(currentTheme: state);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeOptionsWidget extends StatelessWidget {
  final AppThemeOption currentTheme;
  const ThemeOptionsWidget({
    Key? key,
    required this.currentTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeOptions = AppThemeOption.values
        .map((e) => ThemeCard(
              appThemeOption: e,
              isSelected: currentTheme == e,
            ))
        .toList();
    return Column(
      children: themeOptions,
    );
  }
}

class ThemeCard extends StatelessWidget {
  final AppThemeOption appThemeOption;
  final bool isSelected;
  const ThemeCard({
    Key? key,
    required this.appThemeOption,
    required this.isSelected,
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
              if (isSelected) const IconAppearanceMask(icon: Icon(Icons.check))
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
