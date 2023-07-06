part of 'friend_call_cubit.dart';

@freezed
class FriendCallState with _$FriendCallState {
  const factory FriendCallState.initial() = _Initial;

  const factory FriendCallState.connecting() = FriendCallConnecting;

  const factory FriendCallState.preparing({
    required Room room,
    required String token,
  }) = FriendCallPreparing;

  const factory FriendCallState.connectedSuccess({
    required Room room,
  }) = FriendCallConnectedSuccess;

  const factory FriendCallState.connectedFail({String? message}) =
      FriendCallConnectedFail;

  const factory FriendCallState.ended() = FriendCallEnded;
}
