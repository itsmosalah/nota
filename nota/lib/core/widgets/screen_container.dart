import 'package:flutter/material.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';

class ScreenContainer extends StatelessWidget {
  final Widget screen;
  const ScreenContainer({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeSettings.getThemeData(context).colorScheme.secondary,
              ThemeSettings.getThemeData(context).colorScheme.background
            ],
            stops: const [0.1, 0.8],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screen);
  }
}
