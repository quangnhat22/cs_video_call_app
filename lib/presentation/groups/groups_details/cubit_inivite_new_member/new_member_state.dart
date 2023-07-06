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
  const factory NewMemberState.inviteInProgress() = NewMemberInviteInProgress;
  const factory NewMemberState.inviteInSuccess() = NewMemberInviteInSuccess;
  const factory NewMemberState.inviteFail({
    String? message,
  }) = NewMemberInviteFail;
}
