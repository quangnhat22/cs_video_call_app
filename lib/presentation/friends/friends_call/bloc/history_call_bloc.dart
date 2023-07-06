import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_enum.dart';
import 'package:videocall/domain/entities/call_entity.dart';
import 'package:videocall/domain/modules/call/friend_call_use_case.dart';

part 'history_call_bloc.freezed.dart';
part 'history_call_event.dart';
part 'history_call_state.dart';

@Injectable()
class HistoryCallBloc extends Bloc<HistoryCallEvent, HistoryCallState> {
  HistoryCallBloc(this._friendCallUseCase) : super(const _Initial()) {
    on<HistoryCallEvent>((event, emit) async {
      await event.map(
          started: (event) => _started(event, emit),
          filterStatusCall: (event) => _filterStatusCallChange(event, emit));
    });
  }

  final FriendCallUseCase _friendCallUseCase;

  Future<void> _started(_Started event, Emitter<HistoryCallState> emit) async {
    try {
      emit(const HistoryCallLoading());
      final calls = await _friendCallUseCase.getCallList(
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
      final calls = await _friendCallUseCase.getCallList(
          event.status.value.toLowerCase(), null);
      emit(HistoryCallSuccess(calls: calls));
    } catch (e) {
      emit(HistoryCallFailure(message: e.toString()));
    }
  }
}
