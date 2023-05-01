part of setting_cubit;

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial({
    @Default("") String theme,
    @Default("") String lang,
  }) = _Initial;
}
