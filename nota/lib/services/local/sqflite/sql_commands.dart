import '../../../models/label_model.dart';
import '../../../models/note_model.dart';
import '../../../models/notes_labels_model.dart';

class SQLCommands {
  static const String createNotesTable = """
      CREATE TABLE ${NoteModel.dbTableName}(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT);
      """;
  static const String createLabelsTable = """
      CREATE TABLE ${LabelModel.dbTableName}(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        color INTEGER NOT NULL);
      """;
  static const String createNotesLabelsTable = """
            CREATE TABLE ${NotesLabelsModel.dbTableName} (
              id INTEGER PRIMARY KEY, 
              note_id INTEGER NOT NULL,
              label_id INTEGER NOT NULL,
              FOREIGN KEY (note_id) REFERENCES notes (id) 
                ON DELETE CASCADE ON UPDATE NO ACTION,
              FOREIGN KEY (label_id) REFERENCES B (labels) 
                ON DELETE CASCADE ON UPDATE NO ACTION
            )""";
}
