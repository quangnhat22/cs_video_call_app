import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/data/models/group_meeting_model.dart';
import 'package:videocall/data/models/user_model.dart';

class GroupMeetingEntity {
  final String id;
  final String? title;
  final String? description;
  final DateTime? timeStart;
  final DateTime? timeEnd;
  final String? groupId;
  final AppMeetingStatus? meetingStatus;
  final List<UserModel?>? participants;

  GroupMeetingEntity({
    required this.id,
    this.title,
    this.description,
    this.timeStart,
    this.timeEnd,
    this.groupId,
    this.meetingStatus,
    this.participants,
  });

  static final groupMeetingEntityEmpty = GroupMeetingEntity(id: "-1");

  static GroupMeetingEntity convertToGroupMeetingEntity({
    GroupMeetingModel? model,
  }) {
    if (model == null) return groupMeetingEntityEmpty;
    return GroupMeetingEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      timeStart: model.timeStart,
      timeEnd: model.timeEnd,
      groupId: model.groupId,
      meetingStatus: (model.status == "on-going")
          ? AppMeetingStatus.onGoing
          : AppMeetingStatus.ended,
      participants: model.participants,
    );
  }
}
