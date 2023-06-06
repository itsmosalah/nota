import 'model.dart';

class NoteModel extends Model {
  static const String dbTableName = 'notes';

  int id;
  String title;
  String content;
  NoteModel({required this.id, required this.title, required this.content});


  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'];

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };
}
