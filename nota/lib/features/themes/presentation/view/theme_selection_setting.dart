import 'package:flutter/material.dart';
import 'package:nota/features/settings/presentation/view/dark_mode_toggler.dart';
import 'package:nota/features/settings/presentation/view/themes_toggle_buttons.dart';

class ThemeSelectionSetting extends StatelessWidget {
  const ThemeSelectionSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DarkModeToggler(),
        ThemesToggleButtons(),
      ],
    );
  }
}
