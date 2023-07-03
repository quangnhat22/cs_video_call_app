import 'package:videocall/data/models/message_model.dart';
import 'package:videocall/data/models/user_model.dart';

class MessageEntity {
  String id;
  UserModel? sender;
  String? pinnedAt;
  String? content;

  MessageEntity({required this.id, this.sender, this.pinnedAt, this.content});

  static final messageEntityEmpty = MessageEntity(id: "-1");

  static MessageEntity convertToMessageEntity({MessageModel? model}) {
    if (model == null) return messageEntityEmpty;
    return MessageEntity(
      id: model.id,
      sender: model.sender,
      pinnedAt: model.pinnedAt,
      content: model.content,
    );
  }
}
