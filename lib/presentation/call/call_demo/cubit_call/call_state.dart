part of 'call_cubit.dart';

enum CallStatus { calling, accepted, ringing }

@freezed
class CallState with _$CallState {
  const factory CallState.initial({
    RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
    @Default(CallStatus.calling) callStatus,
  }) = _Initial;
}
