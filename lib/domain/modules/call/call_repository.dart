import 'package:flutter_webrtc/flutter_webrtc.dart';

abstract class CallRepository {
  void Function(MediaStream stream)? onAddRemoteStream;

  Future<String?> createRoom(RTCVideoRenderer remoteRenderer, String friendId);

  Future<void> joinRoom(String roomId, RTCVideoRenderer remoteVideo);

  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo);

  Future<void> hangUp(RTCVideoRenderer localVideo);
}
