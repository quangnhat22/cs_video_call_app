import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';

abstract class GroupRepository {
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity?>? members);

  Future<List<GroupEntity>> getGroupList();
}
