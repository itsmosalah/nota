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

  static void createDummyLabels() {
    final dummyData = [
      LabelModel.fromJson(
          {"id": 0, "title": "Work", "color": Colors.red.value}),
      LabelModel.fromJson(
          {"id": 1, "title": "Home", "color": Colors.blue.value}),
      LabelModel.fromJson(
          {"id": 2, "title": "Uni", "color": Colors.cyan.value}),
      LabelModel.fromJson(
          {"id": 3, "title": "Heh", "color": Colors.purple.value}),
      LabelModel.fromJson(
          {"id": 4, "title": "eheh", "color": Colors.green.value}),
      LabelModel.fromJson(
          {"id": 5, "title": "hehehehehehe", "color": Colors.brown.value}),
    ];

    for (var label in dummyData) {
      label.save();
    }
  }

  static Future<List<LabelModel>> listAll() async {
    final db = await Model.database;
    final maps = await db.query(dbTableName);

    return List.generate(maps.length, (i) {
      return LabelModel.fromJson(maps[i]);
    });
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color.value,
      };

  @override
  Future<LabelModel> delete() async {
    final db = await Model.database;

    db.delete(
      dbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return this;
  }

  @override
  Future<LabelModel> save() async {
    final db = await Model.database;
    final json = toJson();
    json.remove('id'); // to avoid replacing old record with conflicting id
    await db.insert(
      dbTableName,
      json,
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return this;
  }

  @override
  Future<LabelModel> update({required Map<String, dynamic> data}) async {
    final db = await Model.database;
    await db.update(
      dbTableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    title = data["title"];
    color = data["color"];
    return this;
  }

  static Future<LabelModel> getById({required int id}) async {
    final db = await Model.database;
    final data = await db.query(dbTableName, where: 'id = ?', whereArgs: [id]);
    return LabelModel.fromJson(data.first);
  }

  Future<Set<NoteModel>> getLabeledNotes() async =>
      getLabeledNotesByLabels(labels: [this]);

  static Future<Set<NoteModel>> getLabeledNotesByLabels(
      {required List<LabelModel> labels}) async {
    final db = await Model.database;

    final labelIDs = labels.map((e) => e.id).toList();

    var idsPlaceholderString = ('?' * labelIDs.length).split('').join(',');

    final notesIDsRecords = await db.query(
      columns: ['note_id'],
      NotesLabelsModel.dbTableName,
      where: 'label_id IN ($idsPlaceholderString)',
      whereArgs: labelIDs,
    );

    final notesIDs = notesIDsRecords.map((e) => e['note_id']).toList();

    idsPlaceholderString = ('?' * notesIDs.length).split('').join(',');

    final notesData = await db.query(
      NoteModel.dbTableName,
      where: 'id IN ($idsPlaceholderString)',
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
