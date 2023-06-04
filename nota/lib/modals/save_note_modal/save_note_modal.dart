import 'package:flutter/material.dart';

import 'name_form.dart';

showSaveNoteModal({
  required BuildContext context,
  required Function saveCallback,
}) {
  final noteNameForm = NameForm(
    cancelCallback: () => Navigator.pop(context),
    title: 'Enter a name for your new note.',
    defaultValue: 'New Note',
    getErrorText: (text) => text.isEmpty ? "Note name cannot be empty" : null,
    submitCallback: (text) {
      saveCallback(name: text);
      Navigator.pop(context);
    },
    submitActionText: 'Save',
    cancelActionText: 'Cancel',
  );

  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        child: noteNameForm,
      ),
    ),
  );
}
