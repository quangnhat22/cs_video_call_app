import 'package:videocall/data/models/group_request_model.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';

class GroupRequestEntity {
  final UserEntity? sender;
  final UserEntity? receiver;
  final GroupEntity? group;
  final DateTime? createdAt;

  GroupRequestEntity({this.sender, this.receiver, this.group, this.createdAt});

  static final groupRequestEmpty = GroupRequestEntity();

  static GroupRequestEntity convertToGroupRequestEntity(
      {GroupRequestModel? model}) {
    if (model == null) return groupRequestEmpty;

    return GroupRequestEntity(
      sender: UserEntity.convertToUserEntity(userModel: model.sender),
      receiver: UserEntity.convertToUserEntity(userModel: model.receiver),
      group: GroupEntity.convertToGroupEntity(model: model.group),
      createdAt: model.createdAt,
    );
  }
}
