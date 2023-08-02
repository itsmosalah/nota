import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:nota/core/widgets/action_text_button.dart';
import 'color_picker_widget.dart';

class SelectColorButton extends StatefulWidget {
  const SelectColorButton({
    super.key,
    required this.colorController,
  });

  final TextEditingController colorController;

  @override
  State<SelectColorButton> createState() => _SelectColorButtonState();
}

class _SelectColorButtonState extends State<SelectColorButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionTextButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Dialog(
              shadowColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 50,
                    child: Text(
                      'Select Color',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ColorPickerWidget(
                    colorController: widget.colorController,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check))
                ],
              ),
            ),
          ),
          text: 'Select color',
        ),
        const Text('Current: '),
        Icon(
          Icons.circle,
          color: colorFromHex(widget.colorController.text),
          shadows: const [Shadow(blurRadius: 5)],
        ),
      ],
    );
  }
}
