import 'package:flutter/material.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/screens/note_screen.dart';
import '../models/note_model.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;
  final int index;
  const NoteTile({super.key, required this.note, required this.index});

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
            NotesDataCubit.get(context).deleteNote(index);
          },
          child: const Icon(Icons.delete),
        ),
        subtitle: Text(
          note.content,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteScreen(note: note),
          ),
        ),
      ),
    );
  }
}
