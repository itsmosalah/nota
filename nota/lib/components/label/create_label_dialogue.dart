import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/modals/save_note_modal/name_form.dart';
import 'color_picker_widget.dart';

class CreateLabelDialogue extends StatelessWidget {
  const CreateLabelDialogue({super.key});
  @override
  Widget build(BuildContext context) {
    final NotesDataCubit cubit = NotesDataCubit.get(context);

    final colorController = TextEditingController(
        text: Colors.purple.value
            .toRadixString(16)
            .substring(2)); // Skipping 2 characters for Alpha

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NameForm(
                submitCallback: (String text) {
                  if (text.isNotEmpty) {
                    cubit.createLabel(
                      title: text,
                      color: colorFromHex(colorController.text)!,
                    );
                    Navigator.pop(context);
                  }
                },
                cancelCallback: () => Navigator.pop(context),
                title: 'Create a new label',
                defaultValue: 'New Label',
                submitActionText: 'Create',
                cancelActionText: 'Cancel',
                getErrorText: (String text) {
                  if (text.isEmpty) {
                    return "Label title cannot be empty.";
                  }
                },
              ),
              SelectColorButton(colorController: colorController)
            ],
          ),
        ),
      ),
    );
  }
}

class SelectColorButton extends StatelessWidget {
  const SelectColorButton({
    super.key,
    required this.colorController,
  });

  final TextEditingController colorController;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
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
                          colorController: colorController,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {});
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.check))
                      ],
                    ))),
            child: const Text('Select color'),
          ),
          const Text('Current: '),
          Icon(
            Icons.circle,
            color: colorFromHex(colorController.text),
          ),
        ],
      ),
    );
  }
}
