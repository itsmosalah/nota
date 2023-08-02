import 'package:flutter/material.dart';
import 'package:nota/features/themes/theme_settings.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeProviderWidget extends StatelessWidget {
  final Widget home;

  const ThemeProviderWidget({
    required this.home,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        final view = View.of(context);

        String? savedTheme = await previouslySavedThemeFuture;

        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              view.platformDispatcher.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: ThemeSettings.getThemesData(),
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nota',
            theme: ThemeProvider.themeOf(themeContext).data,
            home: home,
          ),
        ),
      ),
    );
  }
}
