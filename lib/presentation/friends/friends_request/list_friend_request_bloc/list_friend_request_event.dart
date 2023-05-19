part of 'list_friend_request_bloc.dart';

@freezed
class ListFriendRequestEvent with _$ListFriendRequestEvent {
  const factory ListFriendRequestEvent.started() = _Started;
  const factory ListFriendRequestEvent.listRequestRefreshed() =
      ListSentFriendRequestRefreshed;
}
