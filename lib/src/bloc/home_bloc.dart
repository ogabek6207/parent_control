import 'package:parent_control/src/model/home_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();
  final notesFetch = PublishSubject<List<HomeModel>>();

  Stream<List<HomeModel>> get fetchDrugs => notesFetch.stream;


  getNotes() async {

    var results = await _repository.getNotes();

    notesFetch.sink.add(results);
  }

  dispose() {
    notesFetch.close();
  }
}

final homeBloc = HomeBloc();
