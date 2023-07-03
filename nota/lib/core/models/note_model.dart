import 'package:nota/core/models/label_model.dart';
import 'package:nota/core/models/notes_labels_model.dart';
import 'model.dart';

class NoteModel extends Model {
  static const dbTableName = 'notes';
  int id = -1;
  String title;
  String content;
  List<LabelModel> labels = [];

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
    await Model.database.deleteByIDs(dbTableName, idsList: [id]);
    return this;
  }

  static Future<List<NoteModel>> listAll() async {
    var notesData = await Model.database.listAll(dbTableName);
    var notesList = List.generate(
      notesData.length,
      (i) => NoteModel.fromJson(notesData[i]),
    );

    for (var note in notesList) {
      await note.loadLabels();
    }

    return notesList;
  }

  @override
  Future<NoteModel> save() async {
    id = await Model.database.insert(dbTableName, data: toJson());
    return this;
  }

  @override
  Future<void> update({required Map<String, dynamic> data}) async {
    await Model.database.update(dbTableName, object: this, data: data);
    title = data["title"] ?? title;
    content = data["content"] ?? content;
  }

  Future<void> loadLabels() async {
    var notesLabelsData = await Model.database.getWhere(
      NotesLabelsModel.dbTableName,
      whereColumn: 'note_id',
      whereArgs: [id],
    );
    var labelsIDs = notesLabelsData.map((e) => e["label_id"] as int).toList();

    var labelsData = await Model.database
        .getByIDs(LabelModel.dbTableName, idsList: labelsIDs);

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
