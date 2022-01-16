import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TaskBloc {
  final _repository = Repository();

  final _noteFetch = PublishSubject<List<NotesModel>>();

  final _noteWeekFetch = PublishSubject<int>();
  final _noteWeekEndFetch = PublishSubject<int>();

  final _noteUserFetch = PublishSubject<List<NotesModel>>();

  Stream<List<NotesModel>> get allTask => _noteFetch.stream;

  Stream<List<NotesModel>> get allUserTask => _noteUserFetch.stream;

  Stream<int> get allWeekTask => _noteWeekFetch.stream;

  Stream<int> get allWeekEndTask => _noteWeekEndFetch.stream;

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
  ) async {
    DateTime now = DateTime.now();
    int currentDay = now.weekday;
    DateTime firstDayOfWeek = now.subtract(
      Duration(days: currentDay - 1),
    );
    List<NotesModel> data = [];
    for (int i = 0; i < 7; i++) {
      var results = await _repository.getUserDayNotes(
        userId,
        firstDayOfWeek.add(
          Duration(days: i),
        ),
      );
      data.addAll(results);
    }

    _noteWeekFetch.sink.add(data.length);
  }

  getWeekEndTask(
    int userId,
  ) async {
    DateTime now = DateTime.now();
    int currentDay = now.weekday;
    DateTime firstDayOfWeek = now.subtract(
      Duration(days: currentDay - 1),
    );
    List<NotesModel> data = [];
    for (int i = now.weekday + 1; i < 7; i++) {
      var results = await _repository.getUserDayNotes(
        userId,
        firstDayOfWeek.add(
          Duration(days: i),
        ),
      );
      data.addAll(results);
    }
    var results = await _repository.getUserDayNotes(
      userId,
      now,
    );
    for (int i = 0; i < results.length; i++) {
      if (results[i].startHour >= now.hour) {
        data.add(results[i]);
      }
    }

    _noteWeekEndFetch.sink.add(data.length);
  }

  dispose() {
    _noteFetch.close();
    _noteUserFetch.close();
    _noteWeekFetch.close();
    _noteWeekEndFetch.close();
  }
}

final taskBloc = TaskBloc();
