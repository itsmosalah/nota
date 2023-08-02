import 'package:flutter/material.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';

class ThemesToggleButtons extends StatelessWidget {
  const ThemesToggleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeOptions = ThemeSettings.getThemeOptions(context);

    final selectedThemes = themeOptions
        .map((theme) => theme.id == ThemeSettings.getCurrentThemeID(context))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Select theme: ',
          style: TextStyle(fontSize: 18),
        ),
        StatefulBuilder(
          builder: (context, setState) => ToggleButtons(
            direction: Axis.horizontal,
            isSelected: selectedThemes,
            children: themeOptions
                .map((e) => ThemeColorsPreview(themeData: e.data))
                .toList(),
            onPressed: (int index) => setState(() {
              ThemeSettings.setThemeByID(context, themeOptions[index].id);
              for (var i = 0; i < selectedThemes.length; i++) {
                selectedThemes[i] = i == index;
              }
            }),
          ),
        ),
      ],
    );
  }
}

class ThemeColorsPreview extends StatelessWidget {
  const ThemeColorsPreview({super.key, required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    final displayedColors = [
      themeData.colorScheme.primary,
      themeData.colorScheme.secondary,
      themeData.colorScheme.surface,
    ];
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: displayedColors
            .map((color) => Container(
                  width: 30,
                  height: 15,
                  color: color,
                ))
            .toList(),
      ),
    );
  }
}
