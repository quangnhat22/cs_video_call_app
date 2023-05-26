part of 'send_email_cubit.dart';

@freezed
class SendEmailState with _$SendEmailState {
  const factory SendEmailState.initial() = _Initial;
  const factory SendEmailState.inProgress() = SendEmailInProgress;
  const factory SendEmailState.success() = SendEmailSuccess;
  const factory SendEmailState.failure({required String message}) =
      SendEmailFailure;
}
