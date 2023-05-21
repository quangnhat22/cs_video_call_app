part of 'friends_action_cubit.dart';

@freezed
class FriendsActionState with _$FriendsActionState {
  const factory FriendsActionState.initial() = _Initial;
  const factory FriendsActionState.sentAddRequestSuccess() =
      SentAddRequestFriendSuccess;
  const factory FriendsActionState.sentAddRequestInProgress() =
      SentAddRequestFriendInProgress;
  const factory FriendsActionState.sentAddRequestFailure(
      {required String message}) = SentAddRequestFriendFailure;
}
