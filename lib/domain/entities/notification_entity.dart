import 'package:videocall/data/models/notification_model.dart';

import 'notification_subject_entity.dart';

class NotificationEntity {
  final String id;
  final DateTime? createdAt;
  final NotificationSubjectEntity? subject;
  final NotificationSubjectEntity? prep;
  final NotificationSubjectEntity? indirect;
  final String? action;

  NotificationEntity({
    required this.id,
    this.createdAt,
    this.subject,
    this.prep,
    this.indirect,
    this.action,
  });

  static final notificationEmpty = NotificationEntity(id: '-1');

  static NotificationEntity convertToNotificationEntity(
      {NotificationsModel? model}) {
    if (model == null) return notificationEmpty;
    return NotificationEntity(
      id: model.id,
      createdAt: model.createdAt,
      subject: NotificationSubjectEntity.convertToFriendRequestEntity(
          model: model.subject),
      prep: NotificationSubjectEntity.convertToFriendRequestEntity(
          model: model.prep),
      indirect: NotificationSubjectEntity.convertToFriendRequestEntity(
          model: model.indirect),
      action: model.action,
    );
  }
}
