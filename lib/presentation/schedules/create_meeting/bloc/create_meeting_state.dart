part of 'create_meeting_bloc.dart';

@freezed
class CreateMeetingState with _$CreateMeetingState {
  const factory CreateMeetingState.initial() = _Initial;

  const factory CreateMeetingState.inProgress() = CreateMeetingInProgress;

  const factory CreateMeetingState.inSuccess({required String token}) =
      CreateMeetingInSuccess;

  const factory CreateMeetingState.fail({String? message}) =
      CreateMeetingInFail;
}
