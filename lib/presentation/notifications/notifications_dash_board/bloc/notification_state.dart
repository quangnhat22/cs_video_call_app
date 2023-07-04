part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.getListInProgress() =
      GetListNotificationInProgress;

  const factory NotificationState.getListInSuccess({
    required List<NotificationEntity> listNotification,
  }) = GetListNotificationInSuccess;

  const factory NotificationState.getListFail({
    String? message,
  }) = GetListNotificationInFail;
}
