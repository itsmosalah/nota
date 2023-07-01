import 'package:nota/models/label_model.dart';
import 'package:nota/models/notes_labels_model.dart';

import 'model.dart';

class NoteModel extends Model {
  static const dbTableName = 'notes';
  int id = -1;
  String title;
  List<LabelModel> labels = [];

  NoteModel({required this.title});

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] {
    setContent(json['content']);
  }

  Future<String> getContent() async {
    final db = await Model.database;
    final notesData = await db.query(
      dbTableName,
      where: 'id = ?',
      whereArgs: [id],
      columns: ['content'],
    );

    return notesData.first["content"] as String;
  }

  void setContent(String content) => update(data: {"content": content});

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": "",
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

  static Future<List<NoteModel>> listAll() async {
    final db = await Model.database;
    final notesData = await db.query(dbTableName);

    final notesList = List.generate(
      notesData.length,
      (i) => NoteModel.fromJson(notesData[i]),
    );

    for (var note in notesList) {
      await note.loadLabels();
    }

    return notesList;
  }

  static getNoteByID({required int id}) async {
    final db = await Model.database;
    final noteData = await db.query(
      dbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    final noteObject = NoteModel.fromJson(noteData.first);
    await noteObject.loadLabels();
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
    data = {
      "id": id,
      "title": data["title"] ?? title,
      "content": data["content"] ?? await getContent()
    };
    await db.update(
      dbTableName,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    title = data["title"];
    return this;
  }

  Future<void> loadLabels() async {
    final db = await Model.database;
    final notesLabelsData = await db.query(
      NotesLabelsModel.dbTableName,
      where: 'note_id = ?',
      whereArgs: [id],
    );

    final labelsIDs = notesLabelsData.map((e) => e["label_id"]).toList();

    final idsPlaceholderString = ('?' * labelsIDs.length).split('').join(',');

    final labelsData = await db.query(
      LabelModel.dbTableName,
      where: 'id IN ($idsPlaceholderString)',
      whereArgs: labelsIDs,
    );

    labels = List.generate(
      labelsData.length,
      (i) => LabelModel.fromJson(labelsData[i]),
    );
  }

  Future<void> addLabel({required LabelModel label}) async {
    await NotesLabelsModel(note: this, label: label).save();
    labels.add(label);
  }

  Future<void> removeLabel({required LabelModel label}) async {
    await NotesLabelsModel.deleteWhere(noteID: id, labelID: label.id);
  }

  // comparison
  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) => other is NoteModel && other.id == id;
}
