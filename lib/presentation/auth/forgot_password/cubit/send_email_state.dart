part of 'send_email_cubit.dart';

@freezed
class SendEmailState with _$SendEmailState {
  const factory SendEmailState.initial({
    @Default(Email.pure()) Email email,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
  }) = _Initial;
}
