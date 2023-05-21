part of 'friend_request_action_cubit.dart';

@freezed
class FriendRequestActionState with _$FriendRequestActionState {
  const factory FriendRequestActionState.initial() = _Initial;
  const factory FriendRequestActionState.loading() = FriendActionLoading;
  const factory FriendRequestActionState.success() = FriendActionSuccess;
  const factory FriendRequestActionState.failure({required String message}) =
      FriendActionFailure;
}
