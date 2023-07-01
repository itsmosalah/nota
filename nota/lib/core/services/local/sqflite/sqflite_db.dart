import 'package:nota/core/services/local/sqflite/sql_commands.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  final Future<String> _path = getDatabasesPath();

  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await _path);

  Future<Database> get database async => openDatabase(
        join(await _path, 'nota.db'),
        onCreate: (db, version) async {
          await db.execute(SQLCommands.createNotesTable);
          await db.execute(SQLCommands.createLabelsTable);
          await db.execute(SQLCommands.createNotesLabelsTable);
        },
        version: 1,
      );
}
