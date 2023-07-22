import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomQuillToolbar extends StatelessWidget {
  const CustomQuillToolbar({
    super.key,
    required this.quillController,
  });

  final QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return QuillToolbar.basic(
      controller: quillController,
      showColorButton: false,
      showBackgroundColorButton: false,
      showSubscript: false,
      showSuperscript: false,
      showFontSize: false,
    );
  }
}
