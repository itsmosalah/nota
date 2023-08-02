import 'package:flutter/material.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';

class ActionTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const ActionTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: ThemeSettings.getThemeData(context).textTheme.bodyMedium,
      ),
    );
  }
}
