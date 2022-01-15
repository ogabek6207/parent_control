import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TaskBloc {
  final _repository = Repository();
  final _noteFetch = PublishSubject<List<NotesModel>>();


  final _noteUserFetch = PublishSubject<List<NotesModel>>();

  Stream<List<NotesModel>> get allTask => _noteFetch.stream;



  Stream<List<NotesModel>> get allUserTask => _noteUserFetch.stream;

  getOneTask(
    int userId,
    DateTime dateTime,
  ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);
    _noteFetch.sink.add(results);
  }
  getUserTask(
      int userId,
      DateTime dateTime,
      ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);
    _noteUserFetch.sink.add(results);
  }
  dispose() {
    _noteFetch.close();
    _noteUserFetch.close();
  }

}

final taskBloc = TaskBloc();
