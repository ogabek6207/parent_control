import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class SocialBloc {
  final _repository = Repository();
  final _socialFetch = PublishSubject<List<SocialModel>>();
  final _socialUpdateFetch = PublishSubject<List<SocialModel>>();

  Stream<List<SocialModel>> get fetchSocial => _socialFetch.stream;

  Stream<List<SocialModel>> get fetchUpdateSocial => _socialUpdateFetch.stream;

  getSocial(int id) async {
    var results = await _repository.getSocial(id);
    _socialFetch.sink.add(results);
  }

  getSocialUpdate(int id) async {
    List<SocialModel> data = [
      SocialModel(id: -1, userId: id, typeId: 1),
      SocialModel(id: -1, userId: id, typeId: 2),
      SocialModel(id: -1, userId: id, typeId: 3),
      SocialModel(id: -1, userId: id, typeId: 4),
      SocialModel(id: -1, userId: id, typeId: 5),
      SocialModel(id: -1, userId: id, typeId: 6),
    ];
    var results = await _repository.getSocial(id);
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < results.length; j++) {
        if (data[i].typeId == results[j].typeId) {
          data[i] = results[j];
          data[i].selected = true;
          break;
        }
      }
    }
    _socialUpdateFetch.sink.add(data);
  }

  saveSocial(List<SocialModel> data) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].id != -1 && data[i].selected == false) {
        _repository.deleteSocial(data[i].id);
      } else if (data[i].id == -1 && data[i].selected) {
        _repository.saveSocial(data[i]);
      }
    }
  }

  dispose() {
    _socialFetch.close();
    _socialUpdateFetch.close();
  }
}

final socialBloc = SocialBloc();
