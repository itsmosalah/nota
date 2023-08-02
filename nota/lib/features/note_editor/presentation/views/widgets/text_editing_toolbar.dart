import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import '../../../../themes/presentation/view_model/theme_settings.dart';
import 'custom_quill_toolbar.dart';

class TextEditingToolbar extends StatelessWidget {
  final QuillController quillController;
  const TextEditingToolbar({super.key, required this.quillController});
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Container(
      padding: const EdgeInsets.all(10),
      color: ThemeSettings.getThemeData(context).canvasColor,
      child: FadingEdgeScrollView.fromSingleChildScrollView(
        gradientFractionOnStart: 0.2,
        gradientFractionOnEnd: 0.2,
        child: SingleChildScrollView(
          controller: scrollController,
          clipBehavior: Clip.antiAlias,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 15),
              CustomQuillToolbar(quillController: quillController),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
