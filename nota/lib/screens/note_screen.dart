import 'package:flutter/material.dart';

import '../components/note_scaffold.dart';
import '../models/note_model.dart';

class NoteScreen extends StatelessWidget {
  final NoteModel note;
  const NoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () => print('edit clicked on note ${note.title}'),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      backgroundColor: Colors.grey,
      body: NoteScaffold(
        child: DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) =>
              SingleChildScrollView(child: Text(note.content)),
        ),
      ),
    );
  }
}
