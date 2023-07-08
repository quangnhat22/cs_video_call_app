part of 'notification_setting_cubit.dart';

@freezed
class NotificationSettingState with _$NotificationSettingState {
  const factory NotificationSettingState.initial() = _Initial;

  const factory NotificationSettingState.getSettingInProgress() =
      GetSettingInProgress;

  const factory NotificationSettingState.getSettingInSuccess({
    @Default(false) settingNotification,
  }) = GetSettingInSuccess;

  const factory NotificationSettingState.getSettingInFail() = GetSettingInFail;
}
