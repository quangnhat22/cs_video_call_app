import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart';
import 'package:videocall/data/models/group_details_model.dart';
import 'package:videocall/data/models/group_model.dart';
import 'package:videocall/data/models/group_request_model.dart';
import 'package:videocall/domain/entities/group_detail_entity.dart';
import 'package:videocall/domain/entities/group_entity.dart';
import 'package:videocall/domain/entities/group_request_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';

import '../../domain/modules/group/group_repository.dart';
import '../data_sources/remote/service/group_service.dart';

@Injectable(as: GroupRepository)
class GroupRepositoryImpl extends GroupRepository {
  GroupRepositoryImpl(
      {required GroupService service, required AssetFirebase assetFirebase})
      : _service = service,
        _assetFirebase = assetFirebase;

  final GroupService _service;
  final AssetFirebase _assetFirebase;

  @override
  Future<void> createGroup(
      String? groupName, String? groupImage, List<UserEntity?>? members) async {
    try {
      final listMemberModel = members?.map((member) => member!.id).toList();

      String? imageUrl = groupImage ?? "";
      if (groupImage != null) {
        imageUrl = await _assetFirebase.uploadFile(groupImage);
      }

      await _service.createGroup(groupName, imageUrl, listMemberModel);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<GroupEntity>> getGroupList() async {
    try {
      final res = await _service.getGroupList();
      if (res.statusCode == 200) {
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

  @override
  Future<List<GroupRequestEntity>> getReceivedRequest() async {
    try {
      final res = await _service.getReceivedRequest();
      if (res.statusCode == 201) {
        final listReceivedRequestJson = res.data["data"] as List<dynamic>?;

        if (listReceivedRequestJson != null) {
          final receivedRequestModels = listReceivedRequestJson
              .map((json) => GroupRequestModel.fromJson(json))
              .toList();

          final receivedEntities = receivedRequestModels
              .map((model) =>
                  GroupRequestEntity.convertToGroupRequestEntity(model: model))
              .toList();

          return receivedEntities;
        }
      }

      return List<GroupRequestEntity>.empty();
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<GroupRequestEntity>> getSentRequest() async {
    try {
      final res = await _service.getSentRequest();
      if (res.statusCode == 201) {
        final listSentRequestJson = res.data["data"] as List<dynamic>?;

        if (listSentRequestJson != null) {
          final sentRequestModels = listSentRequestJson
              .map((json) => GroupRequestModel.fromJson(json))
              .toList();

          final sentEntities = sentRequestModels
              .map((model) =>
                  GroupRequestEntity.convertToGroupRequestEntity(model: model))
              .toList();

          return sentEntities;
        }
      }

      return List<GroupRequestEntity>.empty();
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> recallSentRequest(String groupId, String friendId) async {
    try {
      final res = await _service.recallSentRequest(groupId, friendId);
      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> rejectReceivedRequest(String groupId) async {
    try {
      final res = await _service.rejectReceivedRequest(groupId);
      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> acceptReceivedRequest(String groupId) async {
    try {
      final res = await _service.acceptReceivedRequest(groupId);
      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GroupDetailEntity?> getGroupDetail(String id) async {
    try {
      final res = await _service.getGroupDetail(id);
      if (res.statusCode == 200) {
        final groupDetailJson = res.data["data"] as dynamic;

        if (groupDetailJson != null) {
          final groupDetailModel = GroupDetailsModel.fromJson(groupDetailJson);

          final groupDetailEntity =
              GroupDetailEntity.convertToGroupEntity(model: groupDetailModel);

          return groupDetailEntity;
        }
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
