import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';
import 'package:videocall/domain/modules/call/livekit_call_repository.dart';

abstract class LiveKitCallUseCase {
  Future<String?> createMeeting({
    required String groupId,
    String? title,
    String? description,
  });

  Future<String?> joinMeeting({
    required String groupId,
    required String meetingId,
  });

  Future<List<GroupMeetingEntity>> getListMeeting(String groupId);
}

@Injectable(as: LiveKitCallUseCase)
class LiveKitCallUseCaseImpl extends LiveKitCallUseCase {
  final LiveKitCallRepository _repo;

  LiveKitCallUseCaseImpl({required LiveKitCallRepository callGroupRepo})
      : _repo = callGroupRepo;

  @override
  Future<String?> createMeeting({
    required String groupId,
    String? title,
    String? description,
  }) async {
    return await _repo.createMeeting(
        groupId: groupId, title: title, description: description);
  }

  @override
  Future<List<GroupMeetingEntity>> getListMeeting(String groupId) async {
    return await _repo.getListMeeting(groupId);
  }

  @override
  Future<String?> joinMeeting(
      {required String groupId, required String meetingId}) async {
    return await _repo.joinMeeting(groupId: groupId, meetingId: meetingId);
  }
}
