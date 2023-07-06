import 'package:videocall/data/models/meeting_pinned_message_model.dart';
import 'package:videocall/data/models/user_model.dart';

class MeetingPinnedMessageEntity {
  String id;
  DateTime? createdAt;
  String? groupId;
  String? senderId;
  UserModel? sender;
  String? content;
  String? sentAt;

  MeetingPinnedMessageEntity(
      {required this.id,
      this.createdAt,
      this.groupId,
      this.senderId,
      this.sender,
      this.content,
      this.sentAt});

  static final meetingPinnedMessageEntityEmpty =
      MeetingPinnedMessageEntity(id: "-1");

  static MeetingPinnedMessageEntity convertToMeetingPinnedMessageEntity(
      {MeetingPinnedMessageModel? model}) {
    if (model == null) return meetingPinnedMessageEntityEmpty;
    return MeetingPinnedMessageEntity(
      id: model.id,
      createdAt: model.createdAt,
      groupId: model.groupId,
      senderId: model.senderId,
      sender: model.sender,
      content: model.content,
      sentAt: model.sentAt,
    );
  }
}
