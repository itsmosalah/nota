
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class ColorPickerWidget extends StatefulWidget {
  final TextEditingController colorController;

  const ColorPickerWidget({super.key, required this.colorController});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color pickerColor = Colors.purple;
  Color currentColor = Colors.purple;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      colorPickerWidth: 150,
      pickerColor: pickerColor,
      onColorChanged: changeColor,
      enableAlpha: false,
      hexInputBar: false,
      displayThumbColor: false,
      portraitOnly: false,
      hexInputController: widget.colorController,
    );
  }
}
