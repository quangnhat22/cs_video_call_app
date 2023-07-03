import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';

abstract class MessageRepository {
  Future<List<MeetingPinnedMessageEntity>> getPinnedMessages(String groupId);
}
