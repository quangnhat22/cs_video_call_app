part of 'group_call_pin_message_bloc.dart';

@freezed
class GroupCallPinMessageEvent with _$GroupCallPinMessageEvent {
  const factory GroupCallPinMessageEvent.pinMessage(
      {required String? groupId,
      required String? senderId,
      required String? content,
      required DateTime? sentAt}) = PinMessage;
}
