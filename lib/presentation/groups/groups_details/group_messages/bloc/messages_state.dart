part of 'messages_bloc.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState.initial() = _Initial;
  const factory MessagesState.loading() = MessagesLoading;
  const factory MessagesState.success(
      {required List<MeetingPinnedMessageEntity> messages}) = MessagesSuccess;
  const factory MessagesState.failure({
    required String message,
  }) = MessagesFailure;
  const factory MessagesState.unpinSuccess() = MessagesUnpinSuccess;
}
