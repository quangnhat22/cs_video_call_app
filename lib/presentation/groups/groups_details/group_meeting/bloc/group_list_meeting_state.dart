part of 'group_list_meeting_bloc.dart';

@freezed
class GroupListMeetingState with _$GroupListMeetingState {
  const factory GroupListMeetingState.initial() = _Initial;
  const factory GroupListMeetingState.getListInProgress() =
      GroupListMeetingInProgress;
  const factory GroupListMeetingState.getListSuccess({
    required List<GroupMeetingEntity> listMeeting,
  }) = GroupListMeetingSuccess;
  const factory GroupListMeetingState.getListFailure({
    String? message,
  }) = GroupListMeetingFailure;
}
