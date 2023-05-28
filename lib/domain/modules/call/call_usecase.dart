import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/call/call_repository.dart';

typedef StreamStateCallBack = void Function(MediaStream stream);

abstract class CallUseCase {
  StreamStateCallBack? onAddRemoteStream;

  Future<String?> createRoom(RTCVideoRenderer remoteRenderer, String friendId);

  Future<void> joinRoom(String roomId, RTCVideoRenderer remoteVideo);

  Future<void> openUserMedia(
    RTCVideoRenderer localVideo,
    RTCVideoRenderer remoteVideo,
  );

  Future<void> hangUp(RTCVideoRenderer localVideo);

  Future<void> closeRoom();
}

@Injectable(as: CallUseCase)
class CallUseCaseImpl extends CallUseCase {
  final CallRepository _repo;

  @override
  final StreamStateCallBack onAddRemoteStream;

  CallUseCaseImpl(
      {required CallRepository callRepo, required this.onAddRemoteStream})
      : _repo = callRepo;

  @override
  Future<String?> createRoom(RTCVideoRenderer remoteRenderer, String friendId) {
    return _repo.createRoom(remoteRenderer, friendId);
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

  @override
  Future<void> closeRoom() {
    // TODO: implement closeRoom
    throw UnimplementedError();
  }
}
