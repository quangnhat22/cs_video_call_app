import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/domain/entities/call_entity.dart';
import 'package:videocall/domain/modules/friend/friend_usecase.dart';

part 'history_call_event.dart';
part 'history_call_state.dart';
part 'history_call_bloc.freezed.dart';

@Injectable()
class HistoryCallBloc extends Bloc<HistoryCallEvent, HistoryCallState> {
  HistoryCallBloc({required FriendUseCase friendUseCase})
      : _friendUseCase = friendUseCase,
        super(const _Initial()) {
    on<HistoryCallEvent>((event, emit) async {
      await event.map(
          started: (event) => _started(event, emit),
          filterStatusCall: (event) => _filterStatusCallChange(event, emit));
    });
  }

  final FriendUseCase _friendUseCase;

  Future<void> _started(_Started event, Emitter<HistoryCallState> emit) async {
    try {
      emit(const HistoryCallLoading());
      final calls = await _friendUseCase.getCallList(
          event.callStatus?.value, event.callee);
      emit(HistoryCallSuccess(calls: calls));
    } catch (e) {
      emit(HistoryCallFailure(message: e.toString()));
    }
  }

  Future<void> _filterStatusCallChange(
      HistoryCallStatusChange event, Emitter<HistoryCallState> emit) async {
    try {
      emit(const HistoryCallLoading());
      final calls = await _friendUseCase.getCallList(
          event.status.value.toLowerCase(), null);
      emit(HistoryCallSuccess(calls: calls));
    } catch (e) {
      emit(HistoryCallFailure(message: e.toString()));
    }
  }
}
