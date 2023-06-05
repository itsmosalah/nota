import 'package:flutter/material.dart';
import 'package:nota/components/will_pop_scope_dialogue.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/screens/edit_note_screen.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // final NewNoteUI newNote = NewNoteUI(context: context);
    final NotesDataCubit cubit = NotesDataCubit.get(context);

    return WillPopScopeDialogue(
        header: 'Are you sure?',
        textPrompt: 'Exiting will discard the changes.',
        yesActionText: 'Discard',
        noActionText: 'Continue editing',
        child: EditNoteScreen(note: cubit.createNewNote()));
  }
}
