part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
  }) = _Initial;
}
