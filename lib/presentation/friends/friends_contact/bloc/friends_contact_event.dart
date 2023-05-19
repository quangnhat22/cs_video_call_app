part of 'friends_contact_bloc.dart';

@freezed
class FriendsContactEvent with _$FriendsContactEvent {
  const factory FriendsContactEvent.started() = _Started;

  const factory FriendsContactEvent.tappedFriendCard({required String id}) =
      TapFriendContactCard;
}
