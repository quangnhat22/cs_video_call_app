import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';

abstract class MessageRepository {
  Future<List<MeetingPinnedMessageEntity>> getPinnedMessages(String groupId);

  Future<bool> unpinMessage(String messageId);

  Future<String> pinMessage(
      String groupId, String senderId, String content, DateTime sentAt);
}
