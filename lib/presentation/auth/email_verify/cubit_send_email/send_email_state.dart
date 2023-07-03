part of 'send_email_cubit.dart';

@freezed
class SendEmailState with _$SendEmailState {
  const factory SendEmailState.initial({@Default("") String? email}) = _Initial;
  const factory SendEmailState.inProgress({@Default("") String? email}) =
      SendEmailInProgress;
  const factory SendEmailState.success({@Default("") String? email}) =
      SendEmailSuccess;
  const factory SendEmailState.failure(
      {@Default("") String? email, required String message}) = SendEmailFailure;
  const factory SendEmailState.verified({@Default("") String? email}) =
      SendEmailVerified;
  const factory SendEmailState.verifying({@Default("") String? email}) =
      SendEmailVerifying;
  const factory SendEmailState.notVerified({@Default("") String? email}) =
      SendEmailNotVerified;
}
