import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/group_meeting_model.dart';
import 'package:videocall/data/models/message_model.dart';

part 'meeting_pinned_message_model.freezed.dart';
part 'meeting_pinned_message_model.g.dart';

@freezed
class MeetingPinnedMessageModel with _$MeetingPinnedMessageModel {
  const factory MeetingPinnedMessageModel({
    required String id,
    GroupMeetingModel? meeting,
    List<MessageModel?>? pinnedMessages,
  }) = _MeetingPinnedMessageModel;

  factory MeetingPinnedMessageModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingPinnedMessageModelFromJson(json);
}
