part of 'new_member_cubit.dart';

@freezed
class NewMemberState with _$NewMemberState {
  const factory NewMemberState.initial() = _Initial;
  const factory NewMemberState.getListFriendInProgress() =
      NewMemberGetListProgress;
  const factory NewMemberState.getListFriendSuccess({
    required List<UserEntity> listFriend,
  }) = NewMemberGetSuccess;
  const factory NewMemberState.getListFriendFail({
    String? message,
  }) = NewMemberGetFail;
  const factory NewMemberState.inviteInProgress({
    required List<UserEntity> listFriend,
  }) = NewMemberInviteInProgress;
  const factory NewMemberState.inviteInSuccess({
    required List<UserEntity> listFriend,
  }) = NewMemberInviteInSuccess;
  const factory NewMemberState.inviteFail({
    String? message,
    required List<UserEntity> listFriend,
  }) = NewMemberInviteFail;
}
