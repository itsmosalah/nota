import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/components/label/create_label_dialogue.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import '../../models/note_model.dart';
import 'notes_labels_checklist.dart';

class NoteLabelsListDialogue extends StatelessWidget {
  final NoteModel note;
  const NoteLabelsListDialogue({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesDataCubit, NotesDataState>(
      builder: (context, state) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NotesLabelsList(note: note),
                TextButton(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Create New Label',
                    ),
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const CreateLabelDialogue(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
