import 'package:flutter/material.dart';
import 'package:nota/core/widgets/screen_container.dart';
import 'package:nota/features/settings/presentation/view/settings_section.dart';
import 'package:nota/features/themes/presentation/view/theme_selection_setting.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor:
            ThemeSettings.getThemeData(context).colorScheme.primary,
      ),
      body: ScreenContainer(
        screen: Container(
          margin: const EdgeInsets.all(15),
          child: const Column(
            children: [
              SettingsSection(
                title: 'Theme',
                child: ThemeSelectionSetting(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
