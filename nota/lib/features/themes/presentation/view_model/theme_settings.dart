import 'package:flutter/material.dart';
import 'package:nota/features/themes/themes_data.dart';
import 'package:theme_provider/theme_provider.dart';

abstract class ThemeSettings {
  static void cycleTheme(BuildContext context) =>
      ThemeProvider.controllerOf(context).nextTheme();

  static void setThemeByID(BuildContext context, String themeID) =>
      ThemeProvider.controllerOf(context).setTheme(themeID);

  static ThemeData getThemeData(BuildContext context) =>
      ThemeProvider.controllerOf(context).theme.data;

  static void switchThemeBrightness(context) {
    const light = 'light', dark = 'dark';
    String id = ThemeProvider.themeOf(context).id;

    if (id.contains(light)) {
      id = '$dark${id.substring(light.length)}';
    } else {
      id = '$light${id.substring(dark.length)}';
    }
    ThemeProvider.controllerOf(context).setTheme(id);
  }

  static String getCurrentThemeID(context) =>
      ThemeProvider.controllerOf(context).theme.id;

  static List<AppTheme> getThemesData() => themesData;
  static List<AppTheme> getThemeOptions(context) => themesData
      .where((element) =>
          element.data.brightness == getThemeData(context).brightness)
      .toList();
}
