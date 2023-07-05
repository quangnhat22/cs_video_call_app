import 'package:videocall/data/models/notification_subject_model.dart';

class NotificationSubjectEntity {
  final String id;
  final String? name;
  final String? image;
  final String? type;

  NotificationSubjectEntity({
    required this.id,
    this.name,
    this.image,
    this.type,
  });

  static final notificationSubjectEmpty = NotificationSubjectEntity(id: "-1");

  static NotificationSubjectEntity convertToFriendRequestEntity({
    NotificationSubjectModel? model,
  }) {
    if (model == null) return notificationSubjectEmpty;
    return NotificationSubjectEntity(
        id: model.id, name: model.name, image: model.image, type: model.type);
  }
}
