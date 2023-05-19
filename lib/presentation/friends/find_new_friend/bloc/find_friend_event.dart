part of 'find_friend_bloc.dart';

@freezed
class FindFriendEvent with _$FindFriendEvent {
  const factory FindFriendEvent.submitButton({required String email}) =
      SubmitButtonFindFriend;
}
