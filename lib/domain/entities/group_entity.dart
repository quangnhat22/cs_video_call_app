import '../../data/models/group_model.dart';

class GroupEntity {
  String id;
  String? name;
  String? imageUrl;
  List<String?>? members;

  GroupEntity({
    required this.id,
    this.name,
    this.imageUrl,
    this.members,
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
    );
  }
}
