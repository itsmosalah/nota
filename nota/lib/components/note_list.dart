import 'package:flutter/material.dart';
import '../models/note_model.dart';
import 'note_tile.dart';

class NotesList extends StatelessWidget {
  NotesList({super.key});
  final listTiles = [
    for (final object in NoteModel.createDummyList()) NoteTile(note: object)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (context, scrollController) => ListView.builder(
          controller: scrollController,
          itemCount: listTiles.length,
          itemBuilder: (BuildContext context, int index) => listTiles[index],
        ),
      ),
    );
  }
}
