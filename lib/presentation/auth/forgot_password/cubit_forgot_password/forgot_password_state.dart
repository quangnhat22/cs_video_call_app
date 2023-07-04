part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial({
    @Default(Email.pure()) Email email,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
    @Default(false) bool isSentEmail,
  }) = _Initial;
}
