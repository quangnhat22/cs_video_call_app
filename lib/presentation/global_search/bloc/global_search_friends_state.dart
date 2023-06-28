part of 'global_search_friends_bloc.dart';

@freezed
class GlobalSearchFriendsState with _$GlobalSearchFriendsState {
  const factory GlobalSearchFriendsState.initial() = _Initial;
  const factory GlobalSearchFriendsState.loading() = GlobalSearchFriendsLoading;
  const factory GlobalSearchFriendsState.success(
      {required List<UserEntity> friends}) = GlobalSearchFriendsSuccess;
  const factory GlobalSearchFriendsState.failure({
    required String message,
  }) = GlobalSearchFriendsFailure;
}
