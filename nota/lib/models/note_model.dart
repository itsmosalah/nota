import 'model.dart';

class NoteModel extends Model {
  static const dbTableName = 'notes';
  int id = -1;
  String title;
  String content;
  NoteModel({required this.title, required this.content});

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

  @override
  Future<NoteModel> delete() async {
    final db = await Model.database;

    db.delete(
      dbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return this;
  }

  static Future<List<NoteModel>> get listAll async {
    final db = await Model.database;
    final maps = await db.query(dbTableName);

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]);
    });
  }

  @override
  Future<NoteModel> save() async {
    final db = await Model.database;
    final noteJson = toJson();
    noteJson.remove('id'); // to avoid replacing old note with conflicting id
    await db.insert(
      dbTableName,
      noteJson,
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return this;
  }

  @override
  Future<NoteModel> update({required Map<String, dynamic> data}) async {
    final db = await Model.database;
    await db.update(
      dbTableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    title = data["title"];
    content = data["content"];
    return this;
  }
}
