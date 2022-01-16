import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TaskBloc {
  final _repository = Repository();

  final _noteFetch = PublishSubject<List<NotesModel>>();

  final _noteWeekFetch = PublishSubject<List<NotesModel>>();

  final _noteUserFetch = PublishSubject<List<NotesModel>>();

  Stream<List<NotesModel>> get allTask => _noteFetch.stream;

  Stream<List<NotesModel>> get allUserTask => _noteUserFetch.stream;

  Stream<List<NotesModel>> get allWeekTask => _noteWeekFetch.stream;

  getOneTask(
    int userId,
    DateTime dateTime,
  ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);

    _noteFetch.sink.add(results);
  }

  getUserCurrentTask(
    int userId,
    DateTime dateTime,
  ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);
    List<NotesModel> data = [];
    for (int i = 0; i < results.length; i++) {
      if (results[i].startHour <= dateTime.hour &&
          results[i].endHour >= dateTime.hour) {
        data.add(results[i]);
        break;
      }
    }
    _noteUserFetch.sink.add(data);
  }




  getWeekTask(
      int userId,
      DateTime dateTime,
      ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);
    List<NotesModel> data = [];
    for (int i = 0; i < 8-DateTime.now().day; i++) {
      if (results[i].day >= dateTime.weekday) {

        data.add(results[i]);


      }else{
        break;
      }
    }
    _noteWeekFetch.sink.add(data);
  }

  getAllWeekTask(
      int userId,
      DateTime dateTime,
      ) async {
    var results = await _repository.getUserDayNotes(userId, dateTime);
    List<NotesModel> data = [];
    for (int i = 0; i < 8-DateTime.now().day; i++) {
      if (results[dateTime.weekday].day >= dateTime.weekday) {

        data.add(results[i]);


      }else{
        break;
      }
    }
    _noteWeekFetch.sink.add(data);
  }



  dispose() {
    _noteFetch.close();
    _noteUserFetch.close();
    _noteWeekFetch.close();
  }
}

final taskBloc = TaskBloc();
