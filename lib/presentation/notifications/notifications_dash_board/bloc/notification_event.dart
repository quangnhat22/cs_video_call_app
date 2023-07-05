part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.started() = _Started;

  const factory NotificationEvent.refreshed() = NotificationRefreshed;

  const factory NotificationEvent.notificationDeleted({required String id}) =
      NotificationDeletedById;

  const factory NotificationEvent.listNotificationDeleted() =
      ListNotificationDeleted;

  const factory NotificationEvent.actionWithNotification(
      {required String type,
      required String actionType,
      required String id,
      @Default(true) isAccept}) = NotifcationTapped;
}
