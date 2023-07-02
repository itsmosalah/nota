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
  Future<void> save() async =>
      await Model.database.insert(dbTableName, data: toJson());

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'note_id': note.id,
        'label_id': label.id,
      };

  @override
  Future<void> delete() async =>
      await Model.database.deleteByIDs(dbTableName, idsList: [id]);

  static Future<void> deleteWhere(
          {required int noteID, required int labelID}) async =>
      await Model.database.deleteWhereAND(dbTableName,
          whereColumns: ['note_id', 'label_id'], whereArgs: [noteID, labelID]);

  @override
  Future<Model> update({required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }
}
