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

    final colorController = TextEditingController();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NameForm(
                submitCallback: (String text) {
                  cubit.createLabel(
                    title: text,
                    color: colorFromHex(colorController.text)!,
                  );
                  Navigator.pop(context);
                },
                cancelCallback: () => Navigator.pop(context),
                title: 'Create a new label',
                defaultValue: 'New Label',
                submitActionText: 'Create',
                cancelActionText: 'Cancel',
                getErrorText: (String text) {
                  if (text.isEmpty) {
                    return "label title cannot be empty";
                  }
                },
              ),
              TextButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                            child: ColorPickerWidget(
                          colorController: colorController,
                        ))),
                child: const Text('Select color'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
