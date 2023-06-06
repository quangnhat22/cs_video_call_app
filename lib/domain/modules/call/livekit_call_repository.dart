import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';

typedef MediaStreamCallback = void Function(MediaStream stream);

abstract class LiveKitCallRepository {
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
