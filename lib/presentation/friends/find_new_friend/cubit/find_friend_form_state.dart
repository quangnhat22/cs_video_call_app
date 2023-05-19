part of 'find_friend_form_cubit.dart';

@freezed
class FindFriendFormState with _$FindFriendFormState {
  const factory FindFriendFormState.initial({
    @Default(Email.pure()) Email? email,
  }) = _Initial;
}
