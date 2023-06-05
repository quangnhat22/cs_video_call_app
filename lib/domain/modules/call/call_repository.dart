import 'package:flutter_webrtc/flutter_webrtc.dart';

typedef MediaStreamCallback = void Function(MediaStream stream);

abstract class CallRepository {
  Stream<MediaStream> get addRemoteMediaStream;

  Stream<RTCPeerConnectionState> get connectionState;

  Stream<RTCSignalingState> get signalingState;

  Stream<MediaStreamTrack> get localTrackStream;

  Stream<MediaStreamTrack> get remoteTrackStream;

  Future<String?> createRoom(String friendId);

  Future<void> joinRoom(String roomId);

  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo);

  Future<void> hangUp(RTCVideoRenderer localVideo);
}
