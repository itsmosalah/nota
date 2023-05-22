import 'package:flutter/material.dart';
import 'package:nota/components/note_scaffold.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/models/note_model.dart';

class CreateNoteScreen extends StatelessWidget {
  CreateNoteScreen({super.key});

  final focusNode = FocusNode();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new note'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: create saveNoteModal that confirms name and saves
              //  - Implement name text field with default value
              //  - then pass the note to createNote once done
              NotesDataCubit.get(context).createNote(
                  note: NoteModel(
                title: 'New Note',
                content: textController.text,
              ));
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      backgroundColor: Colors.white70,
      body: NoteScaffold(
        child: InkWell(
          onTap: () => focusNode.requestFocus(),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: null,
                autofocus: true,
                focusNode: focusNode,
                controller: textController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
