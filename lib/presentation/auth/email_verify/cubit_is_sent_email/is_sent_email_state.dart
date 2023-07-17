part of 'is_sent_email_cubit.dart';

@freezed
class IsSentEmailState with _$IsSentEmailState {
  const factory IsSentEmailState.initial({
    @Default(false) bool isSentEmail,
    @Default(false) bool disableVerify,
  }) = _Initial;
}
