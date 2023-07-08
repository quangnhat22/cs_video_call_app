import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/user_model.dart';

part 'group_meeting_model.freezed.dart';
part 'group_meeting_model.g.dart';

@freezed
class GroupMeetingModel with _$GroupMeetingModel {
  const factory GroupMeetingModel({
    required String id,
    String? title,
    String? description,
    // ignore: invalid_annotation_target
    @JsonKey(name: "time_start") DateTime? timeStart,
    // ignore: invalid_annotation_target
    @JsonKey(name: "time_end") DateTime? timeEnd,
    String? groupId,
    String? status,
    List<UserModel?>? participants,
  }) = _GroupMeetingModel;

  factory GroupMeetingModel.fromJson(Map<String, dynamic> json) =>
      _$GroupMeetingModelFromJson(json);
}
