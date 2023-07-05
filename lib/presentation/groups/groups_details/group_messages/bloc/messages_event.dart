part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.started({required String groupId}) = _Started;
  const factory MessagesEvent.unpin(
      {required String groupId,
      required String meetingId,
      required String messageId}) = MessagesUnpin;
}
