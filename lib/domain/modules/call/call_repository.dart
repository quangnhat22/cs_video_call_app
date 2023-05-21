import 'package:flutter_webrtc/flutter_webrtc.dart';

abstract class CallRepository {
  Future<String?> createRoom(RTCVideoRenderer remoteRenderer);

  Future<void> joinRoom(String roomId, RTCVideoRenderer remoteVideo);

  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo);

  Future<void> hangUp(RTCVideoRenderer localVideo);
}
