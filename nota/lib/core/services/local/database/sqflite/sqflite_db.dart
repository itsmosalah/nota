import 'package:nota/core/services/local/database/local_database.dart';
import 'package:nota/core/services/local/database/sqflite/sql_commands.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQFliteDB extends LocalDatabase {
  final Future<String> _path = getDatabasesPath();

  @override
  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await _path);

  @override
  Future<Database> get database async => openDatabase(
        join(await _path, 'nota.db'),
        onCreate: (db, version) async {
          await db.execute(SQLCommands.createNotesTable);
          await db.execute(SQLCommands.createLabelsTable);
          await db.execute(SQLCommands.createNotesLabelsTable);
        },
        version: 1,
      );

  @override
  Future<int> deleteByIDs(String table, {required List<int> idsList}) async {
    final db = await database;

    return db.delete(
      table,
      where: 'id IN (${commaSeparatedQuestionMarks(idsList.length)})',
      whereArgs: idsList,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getByIDs(String table,
      {required List<int> idsList, List<String>? columns}) async {
    final db = await database;
    final data = await db.query(
      table,
      where: 'id IN (${commaSeparatedQuestionMarks(idsList.length)})',
      whereArgs: idsList,
    );
    return data;
  }

  @override
  Future<int> insert(String table, {required Map<String, dynamic> data}) async {
    final db = await database;
    data.remove('id'); // to avoid replacing old note with conflicting id
    return await db.insert(
      table,
      data,
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> listAll(String table,
      {List<String>? columns}) async {
    final db = await database;
    return await db.query(table, columns: columns);
  }

  @override
  Future<int> update(String table,
      {required object, required Map<String, dynamic> data}) async {
    data.remove('id');
    final db = await database;
    return await db
        .update(table, data, where: 'id = ?', whereArgs: [object.id]);
  }

  @override
  Future<List<Map<String, dynamic>>> getWhere(String table,
      {required String whereColumn,
      required List<Object?> whereArgs,
      List<String>? columns}) async {
    final db = await database;
    return await db.query(
      table,
      where:
          '$whereColumn ${whereArgs.length == 1 ? '= ${whereArgs.first}' : 'IN (${whereArgs.join(',')})'}',
      columns: columns,
    );
  }

  @override
  Future<int> deleteWhereAND(String table,
      {required List<String> whereColumns,
      required List<dynamic> whereArgs}) async {
    if (whereColumns.length != whereArgs.length) {
      throw "WhereColumns have to have the same number of corresponding values in whereArgs";
    }

    var whereList = List<String>.generate(
        whereColumns.length,
        (i) =>
            '${whereColumns[i]} ${whereArgs[i] is Iterable ? 'IN (${whereArgs.join(',')})' : '= ${whereArgs[i]}'}');

    var db = await database;
    return await db.delete(table, where: whereList.join(' AND '));
  }
}
