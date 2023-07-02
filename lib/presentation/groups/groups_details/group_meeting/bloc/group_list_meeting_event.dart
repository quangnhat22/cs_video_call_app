part of 'group_list_meeting_bloc.dart';

@freezed
class GroupListMeetingEvent with _$GroupListMeetingEvent {
  const factory GroupListMeetingEvent.started({
    required String groupId,
  }) = _Started;
}
