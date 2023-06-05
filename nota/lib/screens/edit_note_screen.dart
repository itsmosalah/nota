import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:nota/components/note_scaffold.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import '../models/note_model.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final cubit = NotesDataCubit.get(context);

    final quillController = QuillController(
      document: Document.fromJson(jsonDecode(note.content)),
      selection: const TextSelection.collapsed(offset: 0),
    );

    void handleChange() {
      final jsonContent = quillController.document.toDelta().toJson();
      cubit.updateNote(
        id: note.id,
        content: jsonEncode(jsonContent),
      );
    }

    quillController.addListener(handleChange);

    final titleEditingController = TextEditingController(text: note.title);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TextField(
          controller: titleEditingController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) => cubit.updateNote(
            id: note.id,
            title: value,
          ),
        ),
      ),
      backgroundColor: Colors.grey,
      body: NoteScaffold(
        child: Column(
          children: [
            // QuillToolbar Colors toolbar Causes overflow.
            // QuillToolbar.basic(controller: controller),
            Expanded(
              child: QuillEditor.basic(
                controller: quillController,
                readOnly: false, // true for view only mode
              ),
            ),
          ],
        ),
      ),
    );
  }
}
