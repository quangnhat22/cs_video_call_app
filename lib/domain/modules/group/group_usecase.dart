import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/group/group_repository.dart';

abstract class GroupUseCase {
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity?>? members);

  Future<List<GroupEntity>> getGroupList();
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
}
