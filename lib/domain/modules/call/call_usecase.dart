import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/call/call_repository.dart';

typedef StreamStateCallBack = void Function(MediaStream stream);

abstract class CallUseCase {
  Future<String?> createRoom(String friendId);

  Future<void> joinRoom(String roomId);

  Future<void> openUserMedia(
    RTCVideoRenderer localVideo,
    RTCVideoRenderer remoteVideo,
  );

  Future<void> hangUp(RTCVideoRenderer localVideo);

  Future<void> closeRoom();

  Stream<MediaStream> get addRemoteMediaStream;

  Stream<RTCPeerConnectionState> get connectionState;

  Stream<RTCSignalingState> get signalingState;

  Stream<MediaStreamTrack> get localTrackStream;

  Stream<MediaStreamTrack> get remoteTrackStream;
}

@Injectable(as: CallUseCase)
class CallUseCaseImpl extends CallUseCase {
  final CallRepository _repo;

  CallUseCaseImpl({required CallRepository callRepo}) : _repo = callRepo;

  @override
  Future<String?> createRoom(String friendId) {
    return _repo.createRoom(friendId);
  }

  @override
  Future<void> hangUp(RTCVideoRenderer localVideo) {
    return _repo.hangUp(localVideo);
  }

  @override
  Future<void> joinRoom(String roomId) {
    return _repo.joinRoom(roomId);
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

  @override
  Stream<MediaStream> get addRemoteMediaStream => _repo.addRemoteMediaStream;

  @override
  Stream<RTCPeerConnectionState> get connectionState => _repo.connectionState;

  @override
  Stream<RTCSignalingState> get signalingState => _repo.signalingState;

  @override
  Stream<MediaStreamTrack> get localTrackStream => _repo.localTrackStream;

  @override
  Stream<MediaStreamTrack> get remoteTrackStream => _repo.remoteTrackStream;
}
