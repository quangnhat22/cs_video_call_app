part of 'edit_theme_cubit.dart';

@freezed
class EditThemeState with _$EditThemeState {
  const factory EditThemeState.initial({
    @Default("System") String theme,
  }) = _Initial;
}
