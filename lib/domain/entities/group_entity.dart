import '../../data/models/group_model.dart';

class GroupEntity {
  final String id;
  final String? name;
  final String? imageUrl;
  final List<String?>? members;
  final bool isHasOnGoingMeeting;

  GroupEntity({
    required this.id,
    this.name,
    this.imageUrl,
    this.members,
    this.isHasOnGoingMeeting = false,
  });

  static final groupEntityEmpty = GroupEntity(id: "-1");

  static GroupEntity convertToGroupEntity({
    GroupModel? model,
  }) {
    if (model == null) return groupEntityEmpty;
    return GroupEntity(
        id: model.id,
        name: model.name,
        imageUrl: model.imageUrl,
        members: model.members,
        isHasOnGoingMeeting:
            model.latestMeeting != null && model.latestMeeting!.isNotEmpty
                ? true
                : false);
  }
}
