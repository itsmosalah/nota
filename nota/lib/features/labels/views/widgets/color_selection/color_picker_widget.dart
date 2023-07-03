import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatefulWidget {
  final TextEditingController colorController;
  const ColorPickerWidget({super.key, required this.colorController});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  void changeColor(Color color) {
    setState(() => widget.colorController.text = color.value
        .toRadixString(16)
        .substring(2)); // skipping 2 characters for alpha
  }

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      colorPickerWidth: 150,
      pickerColor: colorFromHex(widget.colorController.text)!,
      onColorChanged: changeColor,
      enableAlpha: false,
      hexInputBar: false,
      displayThumbColor: false,
      portraitOnly: false,
      hexInputController: widget.colorController,
    );
  }
}
