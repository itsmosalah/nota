abstract class LocalDatabase {
  get database;
  Future<void> deleteDatabase();

  Future<int> update(String table,
      {required object, required Map<String, dynamic> data});

  Future<int> deleteByIDs(String table, {required List<int> idsList});

  Future<int> insert(String table, {required Map<String, dynamic> data});

  Future<List<Map<String, dynamic>>> listAll(String table,
      {List<String>? columns});

  Future<List<Map<String, dynamic>>> getByIDs(String table,
      {required List<int> idsList, List<String>? columns});

  Future<List<Map<String, dynamic>>> getWhere(String table,
      {required String whereColumn,
      required List<dynamic> whereArgs,
      List<String>? columns});

  String commaSeparatedQuestionMarks(int n) => ('?' * n).split('').join(',');

  Future<int> deleteWhereAND(String table,
      {required List<String> whereColumns, required List<dynamic> whereArgs});
}
