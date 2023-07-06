import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/service/message_service.dart';
import 'package:videocall/data/models/meeting_pinned_message_model.dart';
import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';
import 'package:videocall/domain/modules/message/message_repository.dart';

@Injectable(as: MessageRepository)
class MessageRepositoryImpl extends MessageRepository {
  MessageRepositoryImpl({required MessageService messageService})
      : _messageService = messageService;

  final MessageService _messageService;

  @override
  Future<List<MeetingPinnedMessageEntity>> getPinnedMessages(
      String groupId) async {
    try {
      final res = await _messageService.getPinnedMessages(groupId);
      if (res.statusCode == 200) {
        final listMessageJson = res.data["data"] as List<dynamic>?;
        if (listMessageJson != null) {
          final meetingPinnedMessageModels = listMessageJson.map((messageJson) {
            return MeetingPinnedMessageModel.fromJson(messageJson);
          }).toList();

          final meetingPinnedMessageEntities = meetingPinnedMessageModels
              .map((messageModel) => MeetingPinnedMessageEntity
                  .convertToMeetingPinnedMessageEntity(model: messageModel))
              .toList();

          return meetingPinnedMessageEntities;
        }
      }

      return List<MeetingPinnedMessageEntity>.empty();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> unpinMessage(String messageId) async {
    try {
      final res = await _messageService.unpinMessage(messageId);
      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> pinMessage(
      String groupId, String senderId, String content, DateTime sentAt) async {
    try {
      final res =
          await _messageService.pinMessage(groupId, senderId, content, sentAt);
      if (res.statusCode == 200) {
        return res.data['data'];
      }

      return '';
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
