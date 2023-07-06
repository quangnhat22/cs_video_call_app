import 'package:videocall/data/models/message_call_model.dart';

class MessageCallEntity {
  String? groupId;
  String? senderId;
  String? name;
  String? avatar;
  String? message;
  DateTime? senderTime;

  MessageCallEntity(
      {this.groupId,
      this.senderId,
      this.name,
      this.avatar,
      this.message,
      this.senderTime});

  static final messageCallEntityEmpty = MessageCallEntity();

  static MessageCallEntity convertToMessageEntity({MessageCallModel? model}) {
    if (model == null) return messageCallEntityEmpty;
    return MessageCallEntity(
      groupId: model.groupId,
      senderId: model.senderId,
      name: model.name,
      avatar: model.avatar,
      message: model.message,
      senderTime: model.senderTime,
    );
  }
}
