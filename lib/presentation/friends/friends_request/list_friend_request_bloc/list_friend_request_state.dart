part of 'list_friend_request_bloc.dart';

@freezed
class ListFriendRequestState with _$ListFriendRequestState {
  const factory ListFriendRequestState.initial() = _Initial;

  const factory ListFriendRequestState.getDataInProgress() =
      GetListFriendRequestInProgress;

  const factory ListFriendRequestState.getDataSuccess(
          {required List<FriendRequestEntity> friendRequestSent,
          required List<FriendRequestEntity> friendRequestReceive}) =
      GetListFriendRequestSuccess;

  const factory ListFriendRequestState.getDataFail({required String message}) =
      GetListFriendRequestFail;
}
