import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TaskBloc {
  final _repository = Repository();
  final _noteFetch = PublishSubject<List<NotesModel>>();

  Stream<List<NotesModel>> get allTask => _noteFetch.stream;

  getOneTask(
    int userId,
    DateTime dateTime,
  ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);
    _noteFetch.sink.add(results);
  }

  dispose() {
    _noteFetch.close();
  }
}

final taskBloc = TaskBloc();
