import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/message/message_usecase.dart';

part 'group_call_pin_message_event.dart';
part 'group_call_pin_message_state.dart';
part 'group_call_pin_message_bloc.freezed.dart';

@Injectable()
class GroupCallPinMessageBloc
    extends Bloc<GroupCallPinMessageEvent, GroupCallPinMessageState> {
  GroupCallPinMessageBloc({required MessageUseCase messageUseCase})
      : _messageUseCase = messageUseCase,
        super(const _Initial()) {
    on<GroupCallPinMessageEvent>((event, emit) async {
      await event.map(pinMessage: (event) => _pinMessage(event, emit));
    });
  }

  final MessageUseCase _messageUseCase;

  Future<void> _pinMessage(
      PinMessage event, Emitter<GroupCallPinMessageState> emit) async {
    try {
      emit(const GroupCallPinMessageLoading());
      await _messageUseCase.pinMessage(
          event.groupId!, event.senderId!, event.content!, event.sentAt!);
      emit(const GroupCallPinMessageSuccess());
    } catch (e) {
      emit(GroupCallPinMessageFailure(message: e.toString()));
    }
  }
}
