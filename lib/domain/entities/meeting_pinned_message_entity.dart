import 'package:videocall/data/models/group_meeting_model.dart';
import 'package:videocall/data/models/meeting_pinned_message_model.dart';
import 'package:videocall/data/models/message_model.dart';

class MeetingPinnedMessageEntity {
  String id;
  GroupMeetingModel? meeting;
  List<MessageModel?>? pinnedMessages;

  MeetingPinnedMessageEntity(
      {required this.id, this.meeting, this.pinnedMessages});

  static final meetingPinnedMessageEntityEmpty =
      MeetingPinnedMessageEntity(id: "-1");

  static MeetingPinnedMessageEntity convertToMeetingPinnedMessageEntity(
      {MeetingPinnedMessageModel? model}) {
    if (model == null) return meetingPinnedMessageEntityEmpty;
    return MeetingPinnedMessageEntity(
        id: model.id,
        meeting: model.meeting,
        pinnedMessages: model.pinnedMessages);
  }
}
