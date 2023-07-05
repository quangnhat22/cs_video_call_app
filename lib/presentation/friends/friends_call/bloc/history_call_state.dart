part of 'history_call_bloc.dart';

@freezed
class HistoryCallState with _$HistoryCallState {
  const factory HistoryCallState.initial() = _Initial;
  const factory HistoryCallState.loading() = HistoryCallLoading;
  const factory HistoryCallState.success({required List<CallEntity> calls}) =
      HistoryCallSuccess;
  const factory HistoryCallState.failure({required String message}) =
      HistoryCallFailure;
}
