import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/labels/views/widgets/create_label_dialogue.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/features/notes/view_model/states.dart';
import '../../../../core/models/note_model.dart';
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '${note.title}: Labels',
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                NotesLabelsList(note: note),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
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
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
