import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';
import 'package:videocall/domain/modules/message/message_repository.dart';

abstract class MessageUseCase {
  Future<List<MeetingPinnedMessageEntity>> getPinnedMessages(String groupId);

  Future<bool> unpinMessage(String groupId, String meetingId, String messageId);
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
  Future<bool> unpinMessage(
      String groupId, String meetingId, String messageId) async {
    return await _messageRepository.unpinMessage(groupId, meetingId, messageId);
  }
}
