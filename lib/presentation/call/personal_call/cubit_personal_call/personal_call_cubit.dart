import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/call/call_usecase.dart';

part 'personal_call_cubit.freezed.dart';
part 'personal_call_state.dart';

@Injectable()
class PersonalCallCubit extends Cubit<PersonalCallState> {
  PersonalCallCubit({required CallUseCase callUC})
      : _callUC = callUC,
        super(const PersonalCallState.initial());

  Stream<MediaStream> get addRemoteMediaStream => _callUC.addRemoteMediaStream;

  Stream<MediaStreamTrack> get localTrackStream => _callUC.localTrackStream;

  Stream<MediaStreamTrack> get remoteTrackStream => _callUC.remoteTrackStream;

  late StreamSubscription<RTCSignalingState> signalingStateSub;
  late StreamSubscription<RTCPeerConnectionState> connectionStateSub;
  late StreamSubscription<MediaStream> addRemoteMediaStreamSub;

  final CallUseCase _callUC;
  String? friendId;
  ReceivedAction? receivedAction;

  void pageStarted(
    String? friendId,
    ReceivedAction? receivedAction,
  ) {
    signalingStateSub = _callUC.signalingState.listen((st) {
      switch (st) {
        case RTCSignalingState.RTCSignalingStateStable:
          if (state.status != CallStateStatus.initial) {
            emit(state.copyWith(status: CallStateStatus.accepted));
          }
          break;
        case RTCSignalingState.RTCSignalingStateHaveLocalOffer:
        case RTCSignalingState.RTCSignalingStateHaveRemoteOffer:
        case RTCSignalingState.RTCSignalingStateHaveRemotePrAnswer:
        case RTCSignalingState.RTCSignalingStateHaveLocalPrAnswer:
          emit(state.copyWith(status: CallStateStatus.calling));
          break;
        case RTCSignalingState.RTCSignalingStateClosed:
          break;
      }
    });
    connectionStateSub = _callUC.connectionState.listen((event) {});
    addRemoteMediaStreamSub = _callUC.addRemoteMediaStream.listen((event) {});

    this.receivedAction = receivedAction;
    this.friendId = friendId;
  }

  Future<void> setUpRoom() async {
    if (friendId != null) {
      await _callUC.createRoom(friendId!);
    }
    if (receivedAction != null) {
      final res =
          jsonDecode(receivedAction!.payload?["notification"] as String);
      await _callUC.joinRoom(res["prep"]["name"]);
    }
  }

  Future<void> openUserMedia({
    required RTCVideoRenderer local,
    required RTCVideoRenderer remote,
  }) async {
    await _callUC.openUserMedia(local, remote);
    await setUpRoom();
  }

  @override
  Future<void> close() {
    signalingStateSub.cancel();
    connectionStateSub.cancel();
    addRemoteMediaStreamSub.cancel();
    return super.close();
  }
}
