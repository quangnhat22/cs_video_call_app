import 'package:videocall/domain/entities/group_detail_entity.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/group_request_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';

abstract class GroupRepository {
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity?>? members);

  Future<List<GroupEntity>> getGroupList();

  Future<GroupDetailEntity?> getGroupDetail(String id);

  Future<List<GroupRequestEntity>> getReceivedRequest();

  Future<List<GroupRequestEntity>> getSentRequest();

  Future<bool> recallSentRequest(String groupId, String friendId);

  Future<bool> rejectReceivedRequest(String groupId);

  Future<bool> acceptReceivedRequest(String groupId);

  Future<bool> inviteNewMember(String groupId, List<String> friendIds);
}
