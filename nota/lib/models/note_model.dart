import 'package:nota/constants/lorem.dart';

class NoteModel {
  int id;
  String title;
  String content;
  NoteModel({required this.id, required this.title, required this.content});

  static List<NoteModel> createDummyList() {
    return <NoteModel>[
      for (int i = 0; i < 12; i++)
        NoteModel(id: i, title: 'title $i', content: '($i) $lorem')
    ];
  }
}
