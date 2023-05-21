library setting_cubit;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/app_settings/app_settings_usecase.dart';
import '../../../../domain/modules/auth/auth_usecase.dart';

part 'setting_cubit.freezed.dart';
part 'setting_state.dart';

@Injectable()
class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required this.authUseCase,
    required this.appSettingsUseCase,
  }) : super(const SettingState.initial()) {
    getValueThemeAndLang();
  }

  final AuthUseCase authUseCase;
  final AppSettingsUseCase appSettingsUseCase;

  Future<void> getValueThemeAndLang() async {
    final theme = await appSettingsUseCase.getAppTheme();
    final lang = await appSettingsUseCase.getAppLang();

    emit(state.copyWith(theme: theme, lang: lang));
  }

  Future<void> onTapLogOutBtn() async {
    await authUseCase.logOut();
  }
}
