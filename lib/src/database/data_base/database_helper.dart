import 'dart:async';

import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  //user
  final String tableUser = 'userTable';
  final String columnUserId = 'id';
  final String columnUserName = 'name';
  final String columnUserImage = 'image';
  final String columnUserGender = 'gender';

  //social
  final String tableSocial = 'socialTable';
  final String columnSocialId = 'id';
  final String columnSocialTypeId = 'type_id';
  final String columnSocialUserId = 'user_id';

  //notes
  final String tableNotes = 'notesTable';
  final String columnNotesId = 'id';
  final String columnNotesYear = 'year';
  final String columnNotesMonth = 'month';
  final String columnNotesDay = 'day';
  final String columnNotesStartHour = 'start_hour';
  final String columnNotesStartMinute = 'start_minute';
  final String columnNotesEndHour = 'end_hour';
  final String columnNotesEndMinute = 'end_minute';
  final String columnNotesColor = 'color';
  final String columnNotesUserId = 'user_id';
  final String columnNotesTitle = 'title';

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
    // user
    await db.execute('CREATE TABLE $tableUser('
        '$columnUserId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$columnUserName TEXT, '
        '$columnUserImage TEXT, '
        '$columnUserGender INTEGER)');

    //social
    await db.execute('CREATE TABLE $tableSocial('
        '$columnSocialId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$columnSocialTypeId INTEGER, '
        '$columnSocialUserId INTEGER)');

    //notes
    await db.execute('CREATE TABLE $tableNotes('
        '$columnNotesId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$columnNotesUserId INTEGER, '
        '$columnNotesMonth INTEGER, '
        '$columnNotesDay INTEGER, '
        '$columnNotesStartHour INTEGER, '
        '$columnNotesStartMinute INTEGER, '
        '$columnNotesEndHour INTEGER, '
        '$columnNotesEndMinute INTEGER, '
        '$columnNotesColor INTEGER, '
        '$columnNotesTitle INTEGER, '
        '$columnNotesYear INTEGER)');
  }

  //user save
  Future<int> saveProducts(UserModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableUser,
      item.toJson(),
    );
    return result;
  }

  //social save
  Future<int> saveSocial(SocialModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableSocial,
      item.toJson(),
    );
    return result;
  }

  //notes save
  Future<int> saveNotes(NotesModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableNotes,
      item.toJson(),
    );
    return result;
  }

  //user get
  Future<List<UserModel>> getUsers() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableUser');
    List<UserModel> products = <UserModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = UserModel(
        id: list[i][columnUserId],
        name: list[i][columnUserName],
        image: list[i][columnUserImage],
        gender: list[i][columnUserGender],
      );
      products.add(items);
    }
    return products;
  }

  //notes get
  Future<List<NotesModel>> getNotes() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableUser');
    List<NotesModel> products = <NotesModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = NotesModel(
        id: list[i][columnUserId],
        user_id: list[i][columnNotesUserId],
        year: list[i][columnNotesYear],
        day: list[i][columnNotesDay],
        month: list[i][columnNotesMonth],
        start_hour: list[i][columnNotesStartHour],
        start_minute: list[i][columnNotesStartMinute],
        end_hour: list[i][columnNotesEndHour],
        end_minute: list[i][columnNotesEndMinute],
        title: list[i][columnNotesTitle],
        color: list[i][columnNotesColor],
      );
      products.add(items);
    }
    return products;
  }

  //social get
  Future<List<SocialModel>> getSocial(int id) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM $tableSocial WHERE $columnSocialUserId = $id AND $columnSocialId');
    List<SocialModel> social = <SocialModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = SocialModel(
        id: list[i][columnSocialId],
        typeId: list[i][columnSocialTypeId],
        userId: list[i][columnSocialUserId],
      );
      social.add(items);
    }
    return social;
  }

  //user delete
  Future<int> deleteProducts(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableUser,
      where: '$columnUserId = ?',
      whereArgs: [id],
    );
  }

  //social delete
  Future<int> deleteSocial(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableSocial,
      where: '$columnSocialId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteSocialUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableSocial,
      where: '$columnSocialUserId = ?',
      whereArgs: [id],
    );
  }

  //notes delete
  Future<int> deleteNotes(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableNotes,
      where: '$columnNotesUserId = ?',
      whereArgs: [id],
    );
  }

  //user update

  Future<int> updateProduct(UserModel products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableUser,
      products.toJson(),
      where: "$columnUserId = ?",
      whereArgs: [products.id],
    );
  }

//notes update
  Future<int> updateNotes(NotesModel notes) async {
    var dbClient = await db;
    return await dbClient.update(
      tableNotes,
      notes.toJson(),
      where: "$columnNotesUserId = ?",
      whereArgs: [notes.id],
    );
  }

  //social update
  Future<int> updateSocial(SocialModel social) async {
    var dbClient = await db;
    return await dbClient.update(
      tableSocial,
      social.toJson(),
      where: "$columnSocialUserId = ?",
      whereArgs: [social.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  //user clear
  Future<void> clearUser() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableUser');
  }

//social clear
  Future<void> clearSocial() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableSocial');
  }

  //notes clear
  Future<void> clearNotes() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNotes');
  }
}
