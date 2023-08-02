import 'package:flutter/material.dart';
import 'package:nota/features/themes/theme_settings.dart';
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
        title: const Text(
          'Nota',
          style: TextStyle(fontFamily: 'Georgia'),
        ),
        backgroundColor:
            ThemeSettings.getThemeData(context).colorScheme.primary,
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
          IconButton(
            onPressed: () => ThemeSettings.cycleTheme(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor:
          ThemeSettings.getThemeData(context).colorScheme.background,
      body: const NotesList(),
    );
  }
}
