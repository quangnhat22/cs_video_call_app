import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/app_settings/app_settings_usecase.dart';

part 'app_setting_cubit.freezed.dart';
part 'app_setting_state.dart';

@Injectable()
class AppSettingCubit extends Cubit<AppSettingState> {
  final AppSettingsUseCase useCase;
  late final StreamSubscription<String?> _themeSub;
  late final StreamSubscription<String?> _langSub;

  AppSettingCubit({required this.useCase})
      : super(const AppSettingState.initial()) {
    _initThemeAndLang();

    // listen theme change from local storage
    _themeSub = useCase.getAppThemeStream().listen((value) {
      final theme = _convertToThemeMode(value);
      appThemeChanged(theme);
    });
    //listen lang change from local storage
    _langSub = useCase.getAppLangStream().listen((value) {
      final locale = _convertToLocale(value);
      appLangChanged(locale);
    });
  }

  Future<void> _initThemeAndLang() async {
    final themeString = await useCase.getAppTheme();
    final langString = await useCase.getAppLang();

    final themeMode = _convertToThemeMode(themeString);
    final locale = _convertToLocale(langString);

    emit(state.copyWith(theme: themeMode, locale: locale));
  }

  Future<void> appThemeChanged(ThemeMode theme) async {
    emit(state.copyWith(theme: theme));
  }

  Future<void> appLangChanged(Locale locale) async {
    emit(state.copyWith(locale: locale));
  }

  @override
  Future<void> close() async {
    await _themeSub.cancel();
    await _langSub.cancel();
    return super.close();
  }

  ThemeMode _convertToThemeMode(String? value) {
    switch (value) {
      case "Light":
        return ThemeMode.light;
      case "Dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Locale _convertToLocale(String? value) {
    switch (value) {
      case "Vietnamese":
        return const Locale("vi", "VN");
      default:
        return const Locale("en", "US");
    }
  }
}
