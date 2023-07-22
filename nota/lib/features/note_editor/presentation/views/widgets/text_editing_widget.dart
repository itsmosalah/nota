import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:nota/core/models/note_model.dart';

class TextEditingWidget extends StatelessWidget {
  final NoteModel note;
  const TextEditingWidget(
      {super.key, required this.note, required this.quillController});
  final QuillController quillController;

  

  @override
  Widget build(BuildContext context) {
    void handleChange() {
      final jsonContent = quillController.document.toDelta().toJson();
      note.update(data: {"content": jsonEncode(jsonContent)});
    }

    quillController.addListener(handleChange);
    return QuillEditor.basic(
      // QuillToolbar Colors toolbar Causes overflow.
      // QuillToolbar.basic(controller: controller),
      controller: quillController,
      readOnly: false, // true for view only mode
    );
  }
}
