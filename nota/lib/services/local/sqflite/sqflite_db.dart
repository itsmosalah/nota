import 'package:nota/models/note_model.dart';
import 'package:nota/services/local/sqflite/sql_commands.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteDB {
  late Future<String> _path;

  SQFLiteDB() {
    initializeDBPath();
  }

  void initializeDBPath() async => _path = getDatabasesPath();

  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await _path);

  Future<Database> getDatabase() async
      // Open the database and store the reference.
      =>
      openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await _path, 'nota.db'),
        onCreate: (db, version) => db.execute(SQLCommands.createNotesTable),
        version: 1,
      );

  Future<List<NoteModel>> getAllNotes() async {
    final db = await getDatabase();
    final maps = await db.query(NoteModel.dbTableName);

    return List.generate(maps.length, (i) {
      return NoteModel.fromJson(maps[i]);
    });
  }

  Future<NoteModel> getNoteByID(int id, String date) async {
    final db = await getDatabase();

    final json = await db.query(NoteModel.dbTableName,
        where: "id = ?", whereArgs: [id], limit: 1);

    return NoteModel.fromJson(json as Map<String, dynamic>);
  }

  Future<int> insertNote({required NoteModel note}) async {
    final db = await getDatabase();
    return await db.insert(
      NoteModel.dbTableName,
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await getDatabase();

    return db.delete(
      NoteModel.dbTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateNote({required NoteModel note}) async {
    final db = await getDatabase();

    await db.update(
      NoteModel.dbTableName,
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
