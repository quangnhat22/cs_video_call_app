import 'package:flutter/material.dart';
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
      String? groupName, String? groupImage, List<UserEntity?>? members) async {
    try {
      final listMemberModel = members?.map((member) => member!.id).toList();

      await _service.createGroup(groupName, groupImage, listMemberModel);
    } catch (e) {
      debugPrint('here');
      throw Exception(e.toString());
    }
  }
}
