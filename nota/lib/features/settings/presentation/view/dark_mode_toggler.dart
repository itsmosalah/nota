import 'package:flutter/material.dart';
import 'package:nota/core/widgets/switch_button.dart';

class DarkModeToggler extends StatelessWidget {
  const DarkModeToggler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dark mode',
          style: TextStyle(fontSize: 18),
        ),
        SwitchButton()
      ],
    );
  }
}
