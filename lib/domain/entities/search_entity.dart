import 'package:videocall/data/models/search_model.dart';
import 'package:videocall/data/models/user_model.dart';

class SearchEntity {
  List<UserModel>? friends;

  SearchEntity({this.friends});

  static final searchEntityEmpty = SearchEntity();

  static SearchEntity convertToSearchEntity({SearchModel? model}) {
    if (model == null) return searchEntityEmpty;

    return SearchEntity(friends: model.friends);
  }
}
