part of 'find_friend_bloc.dart';

@freezed
class FindFriendState with _$FindFriendState {
  const factory FindFriendState.initial() = _Initial;
  const factory FindFriendState.inProgress() = FindFriendInProgress;
  const factory FindFriendState.success({required UserEntity userResult}) =
      FindFriendSucess;
  const factory FindFriendState.notFound() = FindFriendNotFound;
  const factory FindFriendState.failure({String? message}) = FindFriendFailure;
}
