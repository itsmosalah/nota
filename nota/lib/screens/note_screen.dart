import 'package:flutter/material.dart';

import '../models/note_model.dart';

class NoteScreen extends StatelessWidget {
  final NoteModel note;
  const NoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) =>
              SingleChildScrollView(child: Text(note.content)),
        ),
      ),
    );
  }
}
