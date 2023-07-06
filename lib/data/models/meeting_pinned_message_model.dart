// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/user_model.dart';

part 'meeting_pinned_message_model.freezed.dart';
part 'meeting_pinned_message_model.g.dart';

@freezed
class MeetingPinnedMessageModel with _$MeetingPinnedMessageModel {
  const factory MeetingPinnedMessageModel({
    required String id,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "group_id") String? groupId,
    @JsonKey(name: "sender_id") String? senderId,
    UserModel? sender,
    String? content,
    @JsonKey(name: "sent_at") String? sentAt,
  }) = _MeetingPinnedMessageModel;

  factory MeetingPinnedMessageModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingPinnedMessageModelFromJson(json);
}
