import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

abstract class ThemeSettings {
  static void cycleTheme(BuildContext context) =>
      ThemeProvider.controllerOf(context).nextTheme();

  static void setThemeByID(BuildContext context, String themeID) =>
      ThemeProvider.controllerOf(context).setTheme(themeID);

  static ThemeData getThemeData(BuildContext context) =>
      ThemeProvider.controllerOf(context).theme.data;

  static List<AppTheme> getThemesData() => [
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),
        AppTheme(
          id: "dark_teal",
          description: "Dark Teal Theme",
          data: ThemeData(
            primaryColor: Colors.blueAccent,
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color.fromARGB(255, 0, 100, 95),
              onPrimary: Color.fromARGB(255, 200, 255, 250),
              secondary: Color.fromARGB(255, 0, 100, 95),
              onSecondary: Color.fromARGB(255, 200, 255, 250),
              error: Colors.grey,
              onError: Colors.red,
              background: Color.fromARGB(255, 71, 71, 71),
              onBackground: Color.fromARGB(255, 200, 255, 250),
              surface: Colors.black,
              onSurface: Color.fromARGB(255, 200, 255, 250),
            ),
          ),
        ),
      ];
}
