import 'package:nota/core/models/model.dart';

import 'label_model.dart';
import 'note_model.dart';

class NotesLabelsModel extends Model {
  static const String dbTableName = 'notes_labels';
  int id;
  NoteModel note;
  LabelModel label;

  NotesLabelsModel({required this.note, required this.label}) : id = -1;

  @override
  Future<NotesLabelsModel> save() async {
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
  Map<String, dynamic> toJson() => {
        'id': id,
        'note_id': note.id,
        'label_id': label.id,
      };

  @override
  Future<Model> delete() async {
    final db = await Model.database;

    db.delete(
      dbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return this;
  }

  static Future<void> deleteWhere(
      {required int noteID, required int labelID}) async {
    final db = await Model.database;

    db.delete(
      dbTableName,
      where: 'note_id = ? AND label_id = ?',
      whereArgs: [noteID, labelID],
    );
  }

  @override
  Future<Model> update({required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }
}
