part of 'history_call_bloc.dart';

@freezed
class HistoryCallEvent with _$HistoryCallEvent {
  const factory HistoryCallEvent.started({required AppCallStatus callStatus}) =
      _Started;
}
