import 'package:flutter/material.dart';
import 'package:nota/core/models/model.dart';
import 'package:nota/core/models/note_model.dart';
import 'package:nota/core/models/notes_labels_model.dart';

class LabelModel extends Model {
  static const dbTableName = 'labels';

  int id;
  String title;
  Color color;
  LabelModel({required this.title, required this.color}) : id = -1;
  LabelModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        color = Color(json["color"]);

  static Future<List<LabelModel>> listAll() async {
    var notesData = await Model.database.listAll(dbTableName);
    return List.generate(notesData.length, (i) {
      return LabelModel.fromJson(notesData[i]);
    });
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color.value,
      };

  @override
  Future<void> delete() async =>
      await Model.database.deleteByIDs(dbTableName, idsList: [id]);

  @override
  Future<LabelModel> save() async {
    id = await Model.database.insert(dbTableName, data: toJson());
    return this;
  }

  @override
  Future<void> update({required Map<String, dynamic> data}) async {
    await Model.database.update(dbTableName, objectJson: toJson(), data: data);
    title = data["title"];
    color = data["color"];
  }

  Future<Set<NoteModel>> getLabeledNotes() async =>
      getLabeledNotesByLabels(labels: [this]);

  static Future<Set<NoteModel>> getLabeledNotesByLabels(
      {required List<LabelModel> labels}) async {
    final labelIDs = labels.map((e) => e.id).toList();
    final notesIDsRecords = await Model.database.getWhere(
        NotesLabelsModel.dbTableName,
        whereColumn: 'label_id',
        whereArgs: labelIDs,
        columns: ['note_id']);
    final notesIDs = notesIDsRecords.map((e) => e['note_id']).toList();
    final notesData = await Model.database.getWhere(
      NoteModel.dbTableName,
      whereColumn: 'id',
      whereArgs: notesIDs,
    );
    final notesSet = notesData.map((e) => NoteModel.fromJson(e)).toSet();
    for (var note in notesSet) {
      await note.loadLabels();
    }
    return notesSet;
  }

  // comparison
  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) => other is LabelModel && other.id == id;
}
