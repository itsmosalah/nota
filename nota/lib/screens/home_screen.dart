import 'package:flutter/material.dart';
import 'package:nota/components/note_list.dart';
import '../cubits/notes_data_cubit/cubit.dart';
import 'edit_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = NotesDataCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditNoteScreen(note: cubit.createNewNote()),
                ),
              )
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.white70,
      body: const NotesList(),
    );
  }
}
