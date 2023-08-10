import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:nota/features/note_editor/presentation/views/widgets/text_editing_toolbar.dart';
import 'package:nota/features/notes/views/widgets/note_scaffold.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/features/note_editor/presentation/views/widgets/text_editing_widget.dart';
import 'package:nota/features/themes/presentation/view_model/theme_settings.dart';
import '../../../../core/models/note_model.dart';

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
          backgroundColor:
              ThemeSettings.getThemeData(context).colorScheme.primary,
          title: TextField(
            controller: titleEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        backgroundColor:
            ThemeSettings.getThemeData(context).colorScheme.background,
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
            TextEditingToolbar(quillController: quillController)
          ],
        ),
      ),
    );
  }
}
