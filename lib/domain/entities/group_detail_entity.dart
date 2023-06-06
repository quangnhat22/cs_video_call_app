import 'package:videocall/data/models/group_details_model.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';

class GroupDetailEntity {
  GroupEntity? groupDetails;
  List<UserEntity>? members;

  GroupDetailEntity({
    this.groupDetails,
    this.members,
  });

  static final groupDetailEntityEmpty = GroupDetailEntity();

  static GroupDetailEntity convertToGroupEntity({
    GroupDetailsModel? model,
  }) {
    if (model == null) return groupDetailEntityEmpty;
    return GroupDetailEntity(
      groupDetails: GroupEntity.convertToGroupEntity(model: model.groupDetails),
      members: model.members
          ?.map((member) => UserEntity.convertToUserEntity(userModel: member))
          .toList(),
    );
  }
}
