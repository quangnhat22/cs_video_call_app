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

  void emailVerified() {
    emit(state.copyWith(isEmailVerified: true));
  }

  Future<void> getValueThemeAndLang() async {
    final theme = await appSettingsUseCase.getAppTheme();
    final lang = await appSettingsUseCase.getAppLang();

    emit(state.copyWith(theme: theme, lang: lang));
  }

  Future<void> getSelf() async {
    await userUseCase.getSelf();
  }

  Future<void> userInforChanged() async {
    final userInfo = await userUseCase.getSelfFromLocal();

    //check email verify
    bool isEmailVerify =
        state.isEmailVerified ?? await authUseCase.checkEmailVerify();
    if (!isEmailVerify) {
      isEmailVerify = await authUseCase.checkEmailVerify();
    }

    if (userInfo != null) {
      emit(state.copyWith(
        name: userInfo.name,
        avatar: userInfo.avatar,
        email: userInfo.email,
        isEmailVerified: isEmailVerify,
      ));
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
