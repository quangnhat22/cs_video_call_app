import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';
import 'package:videocall/domain/modules/call/livekit_call_repository.dart';

abstract class LiveKitCallUseCase {
  Future<void> createMeeting({
    required Room room,
    required String groupId,
    String? title,
    String? description,
  });

  Future<void> joinMeeting({
    required Room room,
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
  Future<void> createMeeting({
    required Room room,
    required String groupId,
    String? title,
    String? description,
  }) {
    return _repo.createMeeting(
        room: room, groupId: groupId, title: title, description: description);
  }

  @override
  Future<List<GroupMeetingEntity>> getListMeeting(String groupId) async {
    return await _repo.getListMeeting(groupId);
  }

  @override
  Future<void> joinMeeting(
      {required Room room,
      required String groupId,
      required String meetingId}) {
    return _repo.joinMeeting(
        room: room, groupId: groupId, meetingId: meetingId);
  }
}
