import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import '../../view_model/cubit.dart';

class TextEditingWidget extends StatelessWidget {
  final TextEditingCubit cubit;

  const TextEditingWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final quillController = QuillController(
      document: Document.fromJson(jsonDecode(cubit.noteContent)),
      selection: const TextSelection.collapsed(offset: 0),
    );

    void handleChange() {
      final jsonContent = quillController.document.toDelta().toJson();
      cubit.updateNote(content: jsonEncode(jsonContent));
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
