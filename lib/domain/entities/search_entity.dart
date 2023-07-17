import 'package:videocall/data/models/search_model.dart';
import 'package:videocall/domain/entities/user_entity.dart';

import 'group_entity.dart';

class SearchEntity {
  List<UserEntity>? friends;

  List<GroupEntity>? groups;

  SearchEntity({this.friends, this.groups});

  static final searchEntityEmpty = SearchEntity();

  static SearchEntity convertToSearchEntity({SearchModel? model}) {
    if (model == null) return searchEntityEmpty;

    return SearchEntity(
      friends: model.friends
          ?.map((friend) => UserEntity.convertToUserEntity(userModel: friend))
          .toList(),
      groups: model.groups
          ?.map((group) => GroupEntity.convertToGroupEntity(model: group))
          .toList(),
    );
  }
}
