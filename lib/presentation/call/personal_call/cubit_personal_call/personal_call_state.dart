part of 'personal_call_cubit.dart';

enum CallStateStatus {
  initial, // page initial
  preparing, //not call, just prepare
  start,
  calling,
  accepted,
}

@freezed
class PersonalCallState with _$PersonalCallState {
  const factory PersonalCallState.initial({
    @Default(CallStateStatus.initial) status,
  }) = _Initial;
}
