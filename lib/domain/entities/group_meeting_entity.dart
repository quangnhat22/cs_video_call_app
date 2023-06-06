import 'package:videocall/data/models/group_meeting_model.dart';

class GroupMeetingEntity {
  final String id;
  final String? title;
  final String? description;
  final DateTime? timeStart;
  final String? groupId;
  final String? status;

  GroupMeetingEntity({
    required this.id,
    this.title,
    this.description,
    this.timeStart,
    this.groupId,
    this.status,
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
      groupId: model.groupId,
      status: model.status,
    );
  }
}
