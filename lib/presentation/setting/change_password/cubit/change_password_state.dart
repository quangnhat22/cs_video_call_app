part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial({
    @Default(Password.pure()) Password oldPassword,
    @Default(Password.pure()) Password newPassword,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmPassword,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
  }) = _Initial;
}
