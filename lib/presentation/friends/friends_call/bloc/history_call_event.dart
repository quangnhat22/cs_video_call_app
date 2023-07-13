part of 'history_call_bloc.dart';

@freezed
class HistoryCallEvent with _$HistoryCallEvent {
  const factory HistoryCallEvent.started(
      {AppCallStatus? callStatus, String? callee}) = _Started;
  const factory HistoryCallEvent.refresh(
      {AppCallStatus? callStatus, String? callee}) = HistoryCallRefresh;
  const factory HistoryCallEvent.filterStatusCall(
      {required AppCallStatus status}) = HistoryCallStatusChange;
  const factory HistoryCallEvent.clearHistoryCall() = HistoryCallClear;
}
