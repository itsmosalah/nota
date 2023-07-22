import 'package:flutter/material.dart';
import 'package:nota/features/notes/views/widgets/note_labels_list_dialogue.dart';
import '../../view_model/cubit.dart';
import '../../../../core/models/note_model.dart';

class NoteOptionsDialogue extends StatelessWidget {
  final NoteModel note;
  const NoteOptionsDialogue({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: const Text('Add / remove labels'),
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) => NoteLabelsListDialogue(note: note),
                ).then((_) => Navigator.pop(context));
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                NotesDataCubit.get(context).deleteNote(note: note);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
