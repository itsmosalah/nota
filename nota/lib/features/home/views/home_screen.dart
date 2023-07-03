import 'package:flutter/material.dart';
import '../../notes/views/note_list.dart';
import '../../notes/view_model/cubit.dart';
import '../../note_editor/presentation/views/edit_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = NotesDataCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nota',
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
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
