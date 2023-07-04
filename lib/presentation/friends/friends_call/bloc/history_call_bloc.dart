import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/core/config/app_enum.dart';

part 'history_call_event.dart';
part 'history_call_state.dart';
part 'history_call_bloc.freezed.dart';

class HistoryCallBloc extends Bloc<HistoryCallEvent, HistoryCallState> {
  HistoryCallBloc() : super(const _Initial()) {
    on<HistoryCallEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
