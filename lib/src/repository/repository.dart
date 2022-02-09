import 'package:parent_control/src/data_base/database_helper.dart';
import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/model/user_model.dart';

class Repository {
  DatabaseHelper databaseHelper = DatabaseHelper();

  //user
  Future<int> saveProducts(UserModel item) => databaseHelper.saveUser(item);

  //social
  Future<int> saveSocial(SocialModel item) => databaseHelper.saveSocial(item);

  //notes
  Future<int> saveNotes(NotesModel item) => databaseHelper.saveNotes(item);

  //user
  Future<List<UserModel>> getUsers() => databaseHelper.getUsers();

  //social
  Future<List<SocialModel>> getSocial(int id) => databaseHelper.getSocial(id);

  //notes
  Future<List<NotesModel>> getNotes() => databaseHelper.getNotes();
  //userDay
  Future<List<NotesModel>> getUserDayNotes(
    int userId,
    DateTime dateTime,
  ) =>
      databaseHelper.getUserDayNotes(
        userId,
        dateTime,
      );

  //user
  Future<int> deleteUser(int id) => databaseHelper.deleteUser(id);

  //social
  Future<int> deleteSocial(int id) => databaseHelper.deleteSocial(id);

  //socialUser
  Future<int> deleteSocialUser(int id) => databaseHelper.deleteSocialUser(id);

  //notes
  Future<int> deleteNotes(int id) => databaseHelper.deleteNotes(id);

  //user
  Future<int> updateProduct(UserModel products) =>
      databaseHelper.updateUser(products);

  //social
  Future<int> updateSocial(SocialModel social) =>
      databaseHelper.updateSocial(social);

  //notes
  Future<int> updateNotes(NotesModel notes) =>
      databaseHelper.updateNotes(notes);
}
