import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();
  final notesFetch = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get fetchUser => notesFetch.stream;

  getUsers() async {
    var results = await _repository.getUsers();
    notesFetch.sink.add(results);
  }

  dispose() {
    notesFetch.close();
  }
}

final homeBloc = HomeBloc();
