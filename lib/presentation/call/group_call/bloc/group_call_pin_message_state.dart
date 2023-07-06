part of 'group_call_pin_message_bloc.dart';

@freezed
class GroupCallPinMessageState with _$GroupCallPinMessageState {
  const factory GroupCallPinMessageState.initial() = _Initial;
  const factory GroupCallPinMessageState.loading() = GroupCallPinMessageLoading;
  const factory GroupCallPinMessageState.success() = GroupCallPinMessageSuccess;
  const factory GroupCallPinMessageState.failure({required String message}) =
      GroupCallPinMessageFailure;
}
