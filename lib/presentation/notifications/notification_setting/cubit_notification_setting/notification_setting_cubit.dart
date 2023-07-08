import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/notification/notification_use_case.dart';

part 'notification_setting_cubit.freezed.dart';
part 'notification_setting_state.dart';

@Injectable()
class NotificationSettingCubit extends Cubit<NotificationSettingState> {
  final NotificationUseCase _notificationUseCase;

  NotificationSettingCubit(this._notificationUseCase)
      : super(const NotificationSettingState.initial());

  Future<void> pageStarted() async {
    try {
      emit(const GetSettingInProgress());
      final statusNoti = await _notificationUseCase.getNotificationSetting();
      emit(GetSettingInSuccess(settingNotification: statusNoti));
    } catch (e) {
      emit(const GetSettingInFail());
      throw Exception(e.toString());
    }
  }

  Future<void> updateValue(bool value) async {
    try {
      final isSuccess =
          await _notificationUseCase.updateNotificationSetting(value);
      if (isSuccess) {
        final statusNoti = await _notificationUseCase.getNotificationSetting();
        emit(GetSettingInSuccess(settingNotification: statusNoti));
      }
    } catch (e) {
      emit(const GetSettingInFail());
      throw Exception(e.toString());
    }
  }
}
