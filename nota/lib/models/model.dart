import 'package:sqflite/sqflite.dart';
import '../services/local/sqflite/sqflite_db.dart';

abstract class Model {
  static final _db = LocalDatabase();
  Model();
  Model.fromJson();
  Map<String, dynamic> toJson();

  static Future<Database> get database async => await _db.database;

  Future<Model> save();
  Future<Model> update({required Map<String, dynamic> data});
  Future<Model> delete();
}
