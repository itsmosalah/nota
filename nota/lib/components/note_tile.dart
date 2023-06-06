import 'package:flutter/material.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import '../models/note_model.dart';
import '../screens/edit_note_screen.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;
  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(
          note.title,
          overflow: TextOverflow.ellipsis,
        ),
        leading: const CircleAvatar(
          child: Icon(Icons.notes),
        ),
        trailing: TextButton(
          onPressed: () {
            NotesDataCubit.get(context).deleteNote(note);
          },
          child: const Icon(Icons.delete),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteScreen(note: note),
          ),
        ),
      ),
    );
  }
}
