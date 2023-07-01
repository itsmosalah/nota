import 'package:flutter/material.dart';
import 'package:nota/features/notes/views/widgets/note_options_dialogue.dart';
import '../../../../core/models/note_model.dart';
import '../../../note_editor/presentation/views/edit_note_screen.dart';
import '../../../labels/views/widgets/labels_icons_stack.dart';

class NoteContainer extends StatelessWidget {
  final NoteModel note;
  const NoteContainer({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          onLongPress: () async => await showDialog(
            context: context,
            builder: (context) => NoteOptionsDialogue(note: note),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteScreen(note: note),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    note.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                LabelsIconStack(note: note)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
