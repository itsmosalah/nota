import 'package:sqflite/sqflite.dart';
import '../services/local/database/sqflite/sqflite_db.dart';

abstract class Model {
  static final database = SQFliteDB();
  Model();
  Model.fromJson();
  Map<String, dynamic> toJson();

  Future<void> save();
  Future<void> update({required Map<String, dynamic> data});
  Future<void> delete();
}
