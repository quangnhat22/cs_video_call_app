part of 'sign_up_form_cubit.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState.initial({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    FormzSubmissionStatus? statusSubmit,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
