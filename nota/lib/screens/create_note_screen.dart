import 'package:flutter/material.dart';
import 'package:nota/components/new_note.dart';
import 'package:nota/components/note_scaffold.dart';
import 'package:nota/components/will_pop_scope_dialogue.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewNoteUI newNote = NewNoteUI(context: context);

    return WillPopScopeDialogue(
      header: 'Are you sure?',
      textPrompt: 'Exiting will discard the changes.',
      yesActionText: 'Discard',
      noActionText: 'Continue editing',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create new note'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [newNote.saveNoteButton],
        ),
        backgroundColor: Colors.white70,
        body: NoteScaffold(
          child: newNote.newNoteTextField,
        ),
      ),
    );
  }
}
