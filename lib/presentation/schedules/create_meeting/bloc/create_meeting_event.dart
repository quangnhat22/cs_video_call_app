part of 'create_meeting_bloc.dart';

@freezed
class CreateMeetingEvent with _$CreateMeetingEvent {
  const factory CreateMeetingEvent.started({required String groupId}) =
      _Started;

  const factory CreateMeetingEvent.submit({
    required String meetingTitle,
    String? description,
  }) = CreateMeetingSubmitted;
}
