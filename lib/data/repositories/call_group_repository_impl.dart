import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/service/call_group_service.dart';
import 'package:videocall/data/models/group_meeting_model.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';
import 'package:videocall/domain/modules/call/livekit_call_repository.dart';

@Injectable(as: LiveKitCallRepository)
class CallGroupRepositoryImpl extends LiveKitCallRepository {
  final CallGroupService _service;

  CallGroupRepositoryImpl({required CallGroupService callGroupService})
      : _service = callGroupService;

  @override
  Future<List<GroupMeetingEntity>> getListMeeting(String groupId) async {
    try {
      final res = await _service.getListGroupMeeting(groupId);
      if (res.statusCode == 200) {
        final listMeetingGroupJson = res.data["data"] as List<dynamic>?;

        if (listMeetingGroupJson != null) {
          final listMeetingGroupModels = listMeetingGroupJson.map((groupJson) {
            return GroupMeetingModel.fromJson(groupJson);
          }).toList();

          final groupEntities = listMeetingGroupModels
              .map((groupMeetingModel) =>
                  GroupMeetingEntity.convertToGroupMeetingEntity(
                      model: groupMeetingModel))
              .toList();

          return groupEntities;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> createMeeting(
      {required String groupId, String? title, String? description}) async {
    try {
      final res = await _service.createNewMeeting(groupId, title, description);
      if (res.statusCode == 201) {
        final token = res.data["data"] as String;
        return token;
        //room.connect("ws://192.168.1.192:7880", token);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> joinMeeting(
      {required String groupId, required String meetingId}) async {
    try {
      final res = await _service.joinMeeting(groupId, meetingId);
      if (res.statusCode == 201) {
        final token = res.data["data"] as String;
        return token;
        //room.connect("ws://192.168.1.192:7880", token);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
