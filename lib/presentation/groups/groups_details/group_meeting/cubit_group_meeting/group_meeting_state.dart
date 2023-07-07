part of 'group_meeting_cubit.dart';

@freezed
class GroupMeetingState with _$GroupMeetingState {
  const factory GroupMeetingState.initial() = _Initial;

  const factory GroupMeetingState.getListInProgress() =
      GroupMeetingGetListInProgress;

  const factory GroupMeetingState.getListSuccess({
    required List<GroupMeetingEntity> listMeeting,
  }) = GroupMeetingGetListSuccess;

  const factory GroupMeetingState.getListFail({
    String? message,
  }) = GroupMeetingGetListFail;
}
