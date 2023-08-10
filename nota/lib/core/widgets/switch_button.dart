import 'package:flutter/material.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    bool light =
        ThemeSettings.getThemeData(context).brightness == Brightness.dark;
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: ThemeSettings.getThemeData(context).colorScheme.primary,
      onChanged: (bool value) => setState(() {
        light = value;
        ThemeSettings.switchThemeBrightness(context);
      }),
    );
  }
}
