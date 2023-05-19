part of 'friends_contact_bloc.dart';

@freezed
class FriendsContactState with _$FriendsContactState {
  const factory FriendsContactState.initial() = _Initial;
  const factory FriendsContactState.loading() = FriendsContactLoading;
  const factory FriendsContactState.success(
      {required List<UserEntity> friends}) = FriendsContactSuccess;
  const factory FriendsContactState.failure({
    required String message,
  }) = FriendsContactFailure;
}
