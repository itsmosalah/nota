import 'package:flutter/material.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';

class NoteScaffold extends StatelessWidget {
  const NoteScaffold({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeSettings.getThemeData(context).colorScheme.surface),
      child: child,
    );
  }
}
