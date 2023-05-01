part of 'edit_language_cubit.dart';

@freezed
class EditLanguageState with _$EditLanguageState {
  const factory EditLanguageState.initial({
    @Default("System") String lang,
  }) = _Initial;
}
