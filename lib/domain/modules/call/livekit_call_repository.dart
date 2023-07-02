import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';

typedef MediaStreamCallback = void Function(MediaStream stream);

abstract class LiveKitCallRepository {
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
