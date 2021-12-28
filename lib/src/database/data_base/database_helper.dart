import 'dart:async';

import 'package:parent_control/src/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableNote = 'userTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnImage = 'image';
  final String columnGender = 'gender';

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'parentControl.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $tableNote('
        '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$columnName TEXT, '
        '$columnImage TEXT, '
        '$columnGender INTEGER)');
  }

  Future<int> saveProducts(UserModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableNote,
      item.toJson(),
    );
    return result;
  }

  Future<List<UserModel>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableNote');
    List<UserModel> products = <UserModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = UserModel(
        id: list[i][columnId],
        name: list[i][columnName],
        image: list[i][columnImage],
        gender: list[i][columnGender],
      );
      products.add(items);
    }
    return products;
  }

  Future<int> deleteProducts(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableNote,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateProduct(UserModel products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableNote,
      products.toJson(),
      where: "$columnId = ?",
      whereArgs: [products.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNote');
  }
}
