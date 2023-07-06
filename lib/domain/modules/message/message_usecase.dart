import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';
import 'package:videocall/domain/modules/message/message_repository.dart';

abstract class MessageUseCase {
  Future<List<MeetingPinnedMessageEntity>> getPinnedMessages(String groupId);

  Future<bool> unpinMessage(String messageId);

  Future<String> pinMessage(
      String groupId, String senderId, String content, DateTime sentAt);
}

@Injectable(as: MessageUseCase)
class MessageUseCaseImpl extends MessageUseCase {
  MessageUseCaseImpl({required MessageRepository messageRepository})
      : _messageRepository = messageRepository;

  final MessageRepository _messageRepository;

  @override
  Future<List<MeetingPinnedMessageEntity>> getPinnedMessages(
      String groupId) async {
    return await _messageRepository.getPinnedMessages(groupId);
  }

  @override
  Future<bool> unpinMessage(String messageId) async {
    return await _messageRepository.unpinMessage(messageId);
  }

  @override
  Future<String> pinMessage(
      String groupId, String senderId, String content, DateTime sentAt) async {
    return await _messageRepository.pinMessage(
        groupId, senderId, content, sentAt);
  }
}
