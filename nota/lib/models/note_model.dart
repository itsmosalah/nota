import 'package:nota/constants/lorem.dart';

class NoteModel {
  String title;
  String content;
  NoteModel({required this.title, required this.content});

  static List<NoteModel> createDummyList() {
    return <NoteModel>[
      for (int i = 0; i < 12; i++)
        NoteModel(
            title: 'title $i',
            content:
                '($i) $lorem')
    ];
  }
}
