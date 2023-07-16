part of 'friend_info_cubit.dart';

@freezed
class FriendInfoState with _$FriendInfoState {
  const factory FriendInfoState.initial() = _Initial;

  const factory FriendInfoState.getInfoInProgress() = GetInfoFriendInProgress;

  const factory FriendInfoState.getInfoInSuccess(
      {required UserEntity friendInfo}) = GetInfoFriendInSuccess;

  const factory FriendInfoState.getInfoFail() = GetInfoFriendInFail;
}
