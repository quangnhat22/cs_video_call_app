library setting_cubit;

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/modules/app_settings/app_settings_usecase.dart';
import '../../../../domain/modules/auth/auth_usecase.dart';

part 'setting_cubit.freezed.dart';
part 'setting_state.dart';

@Injectable()
class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required this.authUseCase,
    required this.userUseCase,
    required this.appSettingsUseCase,
  }) : super(const SettingState.initial()) {
    userSubcription = userUseCase.getStreamSelfFromLocal().listen((user) {
      if (user != null) {
        userInforChanged();
      }
    });
  }

  final AuthUseCase authUseCase;
  final UserUseCase userUseCase;
  final AppSettingsUseCase appSettingsUseCase;
  late StreamSubscription<UserEntity?> userSubcription;

  Future<void> getValueThemeAndLang() async {
    final theme = await appSettingsUseCase.getAppTheme();
    final lang = await appSettingsUseCase.getAppLang();

    emit(state.copyWith(theme: theme, lang: lang));
  }

  Future<void> getSelf() async {
    await userUseCase.getSelf();
  }

  Future<bool> checkEmailVerify() async {
    if (state.isEmailVerified == true) {
      return true;
    } else {
      bool checkVerifyEmail = await authUseCase.checkEmailVerify();
      emit(state.copyWith(isEmailVerified: checkVerifyEmail));
      return checkVerifyEmail;
    }
  }

  Future<void> userInforChanged() async {
    final userInfo = await userUseCase.getSelfFromLocal();

    if (userInfo != null) {
      await checkEmailVerify();
      emit(
        state.copyWith(
          name: userInfo.name,
          avatar: userInfo.avatar,
          email: userInfo.email,
        ),
      );
    }
  }

  Future<void> onTapLogOutBtn() async {
    await authUseCase.logOut();
  }

  @override
  Future<void> close() {
    userSubcription.cancel();
    return super.close();
  }
}
