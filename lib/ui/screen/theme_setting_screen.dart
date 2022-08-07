import 'package:flutter/material.dart';
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
          children: const [
            TitleLargeText('Themes'),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
