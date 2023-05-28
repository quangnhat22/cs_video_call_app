import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/user_entity.dart';

import '../../domain/modules/group/group_repository.dart';
import '../data_sources/remote/service/group_service.dart';

@Injectable(as: GroupRepository)
class GroupRepositoryImpl extends GroupRepository {
  GroupRepositoryImpl({required GroupService service}) : _service = service;

  final GroupService _service;

  @override
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity> members) async {
    try {
      await _service.createGroup(groupName, groupImage, members);
    } catch (e) {
      throw Exception(e);
    }
  }
}
