part of 'app_setting_cubit.dart';

@freezed
class AppSettingState with _$AppSettingState {
  const factory AppSettingState.initial({
    @Default(ThemeMode.system) ThemeMode theme,
    @Default(Locale('en', 'US')) Locale locale,
  }) = _Initial;
}
