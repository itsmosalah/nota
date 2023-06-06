import 'package:nota/models/note_model.dart';

class SQLCommands {
  static const String createNotesTable =
      'CREATE TABLE ${NoteModel.dbTableName}(id INTEGER PRIMARY KEY, title TEXT, content TEXT)';
}
