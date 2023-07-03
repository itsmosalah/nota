import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:nota/features/labels/views/widgets/color_selection/select_color_button.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/core/widgets/name_form.dart';

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
