import 'package:nota/services/local/sqflite/sql_commands.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  late Future<String> _path;

  LocalDatabase() {
    initializeDBPath();
  }

  void initializeDBPath() async => _path = getDatabasesPath();

  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await _path);

  Future<Database> get database async
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
}
