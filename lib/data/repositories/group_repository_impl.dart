import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/models/group_model.dart';
import 'package:videocall/domain/entities/group_entity.dart';
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
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<GroupEntity>> getGroupList() async {
    try {
      final res = await _service.getGroupList();
      if (res.statusCode == 201) {
        final listGroupJson = res.data["data"] as List<dynamic>?;

        if (listGroupJson != null) {
          final groupModels = listGroupJson.map((groupJson) {
            return GroupModel.fromJson(groupJson);
          }).toList();

          final groupEntities = groupModels
              .map((groupModel) =>
                  GroupEntity.convertToGroupEntity(model: groupModel))
              .toList();

          return groupEntities;
        }
      }

      return List<GroupEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
