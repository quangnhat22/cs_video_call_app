import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/group_detail_entity.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/group_request_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/group/group_repository.dart';

abstract class GroupUseCase {
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity?>? members);

  Future<void> editGroup(String? groupName, String? groupImage, String groupId);

  Future<List<GroupEntity>> getGroupList();

  Future<GroupDetailEntity?> getGroupDetail(String id);

  Future<List<GroupRequestEntity>> getReceivedRequest();

  Future<List<GroupRequestEntity>> getSentRequest();

  Future<bool> recallSentRequest(String groupId, String friendId);

  Future<bool> rejectReceivedRequest(String groupId);

  Future<bool> acceptReceivedGroup(String groupId);

  Future<bool> inviteNewMember(String groupId, List<String> friendIds);

  Future<bool> leaveGroup(String groupId);
}

@Injectable(as: GroupUseCase)
class GroupUseCaseImpl extends GroupUseCase {
  GroupUseCaseImpl({required GroupRepository groupRepo}) : _repo = groupRepo;

  final GroupRepository _repo;

  @override
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity?>? members) {
    return _repo.createGroup(groupName, groupImage, members);
  }

  @override
  Future<List<GroupEntity>> getGroupList() async {
    return await _repo.getGroupList();
  }

  @override
  Future<List<GroupRequestEntity>> getReceivedRequest() async {
    return await _repo.getReceivedRequest();
  }

  @override
  Future<List<GroupRequestEntity>> getSentRequest() async {
    return await _repo.getSentRequest();
  }

  @override
  Future<bool> recallSentRequest(String groupId, String friendId) async {
    return await _repo.recallSentRequest(groupId, friendId);
  }

  @override
  Future<bool> rejectReceivedRequest(String groupId) async {
    return await _repo.rejectReceivedRequest(groupId);
  }

  @override
  Future<bool> acceptReceivedGroup(String groupId) async {
    return await _repo.acceptReceivedRequest(groupId);
  }

  @override
  Future<GroupDetailEntity?> getGroupDetail(String id) async {
    return await _repo.getGroupDetail(id);
  }

  @override
  Future<bool> inviteNewMember(String groupId, List<String> friendIds) async {
    return await _repo.inviteNewMember(groupId, friendIds);
  }

  @override
  Future<bool> leaveGroup(String groupId) async {
    return await _repo.leaveGroup(groupId);
  }

  @override
  Future<void> editGroup(
      String? groupName, String? groupImage, String groupId) async {
    return await _repo.editGroup(groupName, groupImage, groupId);
  }
}
