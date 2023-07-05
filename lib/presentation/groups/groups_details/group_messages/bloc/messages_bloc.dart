import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/meeting_pinned_message_entity.dart';
import 'package:videocall/domain/modules/message/message_usecase.dart';

part 'messages_event.dart';
part 'messages_state.dart';
part 'messages_bloc.freezed.dart';

@Injectable()
class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc({required MessageUseCase messageUseCase})
      : _messageUseCase = messageUseCase,
        super(const _Initial()) {
    on<MessagesEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        unpin: (event) => _unpinMessage(event, emit),
      );
    });
  }

  final MessageUseCase _messageUseCase;

  Future<void> _started(_Started event, Emitter<MessagesState> emit) async {
    try {
      emit(const MessagesLoading());
      final pinnedMessages =
          await _messageUseCase.getPinnedMessages(event.groupId);
      emit(MessagesSuccess(messages: pinnedMessages));
    } catch (e) {
      emit(MessagesFailure(message: e.toString()));
    }
  }

  Future<void> _unpinMessage(
      MessagesUnpin event, Emitter<MessagesState> emit) async {
    try {
      emit(const MessagesLoading());
      await _messageUseCase.unpinMessage(
          event.groupId, event.meetingId, event.messageId);
      emit(const MessagesUnpinSuccess());
    } catch (e) {
      emit(MessagesFailure(message: e.toString()));
    }
  }
}
