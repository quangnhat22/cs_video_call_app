import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/call/call_repository.dart';

abstract class CallUseCase {
  Future<String?> createRoom(RTCVideoRenderer remoteRenderer);

  Future<void> joinRoom(String roomId, RTCVideoRenderer remoteVideo);

  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo);

  Future<void> hangUp(RTCVideoRenderer localVideo);
}

@Injectable(as: CallUseCase)
class CallUseCaseImpl extends CallUseCase {
  final CallRepository _repo;

  CallUseCaseImpl({required CallRepository callRepo}) : _repo = callRepo;

  @override
  Future<String?> createRoom(RTCVideoRenderer remoteRenderer) {
    return _repo.createRoom(remoteRenderer);
  }

  @override
  Future<void> hangUp(RTCVideoRenderer localVideo) {
    return _repo.hangUp(localVideo);
  }

  @override
  Future<void> joinRoom(String roomId, RTCVideoRenderer remoteVideo) {
    return _repo.joinRoom(roomId, remoteVideo);
  }

  @override
  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo) {
    return _repo.openUserMedia(localVideo, remoteVideo);
  }
}
