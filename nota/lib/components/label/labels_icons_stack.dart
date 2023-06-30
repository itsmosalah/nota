import 'package:flutter/material.dart';

import '../../models/note_model.dart';

class LabelsIconStack extends StatelessWidget {
  const LabelsIconStack({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(width: 150, height: 40),
        for (int i = 0; i < note.labels.length; i++)
          Positioned(
            right: 10.0 * i,
            child: Icon(
              Icons.label_rounded,
              color: note.labels[i].color,
              size: 2 * (i + 15),
            ),
          ),
      ],
    );
  }
}
