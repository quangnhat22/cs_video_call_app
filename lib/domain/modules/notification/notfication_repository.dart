import 'package:videocall/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getListNotification();

  Future<bool> deleteNotificationById(String id);

  Future<bool> deleteAllNotification();

  Future<bool> getNotificationSetting();

  Future<bool> updateNotificationSetting(bool value);
}
