import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class SocialBloc {
  final _repository = Repository();
  final socialFetch = PublishSubject<List<SocialModel>>();

  Stream<List<SocialModel>> get fetchSocial => socialFetch.stream;

  getSocial(int id) async {
    var results = await _repository.getSocial(id);

    socialFetch.sink.add(results);
  }

  dispose() {
    socialFetch.close();
  }
}

final socialBloc = SocialBloc();
