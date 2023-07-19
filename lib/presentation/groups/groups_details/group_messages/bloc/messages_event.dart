part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.started({required String groupId}) = _Started;

  const factory MessagesEvent.refreshed() = MessageRefreshed;

  const factory MessagesEvent.unpin({required String messageId}) =
      MessagesUnpin;
}
