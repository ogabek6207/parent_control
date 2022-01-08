import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();
  final userFetch = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get fetchUser => userFetch.stream;

  getUsers() async {
    var results = await _repository.getUsers();
    userFetch.sink.add(results);
  }

  dispose() {
    userFetch.close();
  }
}

final homeBloc = HomeBloc();
