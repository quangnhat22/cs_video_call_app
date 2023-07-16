part of 'call_group_status_cubit.dart';

@freezed
class CallGroupStatusState with _$CallGroupStatusState {
  const factory CallGroupStatusState.initial() = _Initial;

  const factory CallGroupStatusState.connecting() = CallGroupConnecting;

  const factory CallGroupStatusState.preparing({
    required Room room,
  }) = CallGroupPreparing;

  const factory CallGroupStatusState.connectedSuccess({
    UserEntity? user,
    List<MessageCallEntity>? listMessage,
    List<String>? messagePin,
    required Room room,
  }) = CallGroupConnectedSuccess;

  const factory CallGroupStatusState.connectedFail({String? message}) =
      CallGroupConnectedFail;

  const factory CallGroupStatusState.ended() = CallGroupEnded;
}
