import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();
  final notesFetch = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get fetchDrugs => notesFetch.stream;

  getProduct() async {
    var results = await _repository.getProduct();

    notesFetch.sink.add(results);
  }

  dispose() {
    notesFetch.close();
  }
}

final homeBloc = HomeBloc();
