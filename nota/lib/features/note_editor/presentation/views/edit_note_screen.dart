import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:nota/features/notes/views/widgets/note_scaffold.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/features/note_editor/presentation/views/widgets/text_editing_widget.dart';
import '../../../../core/models/note_model.dart';
import 'widgets/custom_quill_toolbar.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final titleEditingController = TextEditingController(text: note.title);

    final quillController = QuillController(
      document: Document.fromJson(jsonDecode(note.content)),
      selection: const TextSelection.collapsed(offset: 0),
    );

    return WillPopScope(
      onWillPop: () async {
        NotesDataCubit.get(context)
            .updateNoteTitle(note: note, newTitle: titleEditingController.text);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: TextField(
            controller: titleEditingController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Expanded(
              child: NoteScaffold(
                child: Column(
                  children: [
                    Expanded(
                      child: TextEditingWidget(
                        note: note,
                        quillController: quillController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.deepPurple[100],
              child: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomQuillToolbar(quillController: quillController)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
