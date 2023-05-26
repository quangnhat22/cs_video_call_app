part of setting_cubit;

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial({
    String? avatar,
    String? name,
    String? email,
    bool? isEmailVerified,
    @Default("") String theme,
    @Default("") String lang,
  }) = _Initial;
}
