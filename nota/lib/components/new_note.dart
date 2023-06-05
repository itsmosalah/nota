import 'package:flutter/material.dart';

import '../cubits/notes_data_cubit/cubit.dart';
import '../modals/save_note_modal/save_note_modal.dart';

class NewNoteUI {
  final BuildContext context;
  final focusNode = FocusNode();
  final textController = TextEditingController();

  late final IconButton saveNoteButton;
  late final Widget newNoteTextField;

  NewNoteUI({required this.context}) {
    saveNoteButton = IconButton(
      onPressed: () {
        showSaveNoteModal(
          context: context,
          saveCallback: handleSaveNewNote,
        );
      },
      icon: const Icon(Icons.check),
    );

    newNoteTextField = InkWell(
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
    );
  }

  handleSaveNewNote({required String name}) {
    Navigator.pop(context);
    NotesDataCubit.get(context).createNote(
      title: name,
      content: textController.text,
    );
  }
}
