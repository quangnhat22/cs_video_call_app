import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/firebase/personal_call_room_firebase.dart';
import 'package:videocall/data/data_sources/remote/service/call_serivce.dart';
import 'package:videocall/domain/modules/call/call_repository.dart';

@Injectable(as: CallRepository)
class WebRTCRepositoryImpl extends CallRepository {
  final PersonalCallRoomFirebase _personalCallRoomFB;
  final CallService _callService;

  final StreamController<RTCPeerConnectionState> _connectionState;
  final StreamController<MediaStream> _onAddRemoteMediaStream;
  final StreamController<RTCSignalingState> _signalingState;
  final StreamController<MediaStreamTrack> _remoteTrackStream;
  final StreamController<MediaStreamTrack> _localTrackStream;

  WebRTCRepositoryImpl(
      {required PersonalCallRoomFirebase callRoomFirebase,
      required CallService callService})
      : _personalCallRoomFB = callRoomFirebase,
        _callService = callService,
        _connectionState = StreamController(),
        _onAddRemoteMediaStream = StreamController.broadcast(),
        _signalingState = StreamController.broadcast(),
        _remoteTrackStream = StreamController.broadcast(),
        _localTrackStream = StreamController.broadcast();

  Map<String, dynamic> configuration = {
    'iceServers': [
      {
        'urls': [
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302'
        ]
      }
    ]
  };

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  MediaStream? _remoteStream;
  String? _roomId;

  @override
  Future<String?> createRoom(String friendId) async {
    _roomId = _personalCallRoomFB.createChatRoom(null);
    if (_roomId == null) return null;
    _callService.createNewCall(friendId, _roomId!);

    _peerConnection = await createPeerConnection(configuration);

    _registerPeerConnectionListeners();

    _localStream?.getTracks().forEach((track) {
      _peerConnection?.addTrack(track, _localStream!);
    });

    _peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
      log('Got candidate: ${candidate.toMap()}');
      _personalCallRoomFB.addCandidate(
          TypeCandidate.senderCandidate, candidate);
    };

    ///create offer
    RTCSessionDescription offer = await _peerConnection!.createOffer();
    await _peerConnection!.setLocalDescription(offer);
    _personalCallRoomFB.setOffer(offer);

    _peerConnection?.onTrack = (RTCTrackEvent track) {
      log('Got remote track: ${track.streams[0]}',
          name: "WebRTC - got remote track");

      track.streams[0].getTracks().forEach((track) {
        log('Add a track to the remote stream $track',
            name: "WebRTC - Add remote stream");
        _remoteStream?.addTrack(track);
      });
    };

    /// listen for waiting a answer from firbase
    _personalCallRoomFB.getChatRoomStream().listen((snapshot) async {
      log('Got updated room: ${snapshot.data()}');
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      if (_peerConnection?.getRemoteDescription() != null &&
          data['answer'] != null) {
        final answer = RTCSessionDescription(
          data['answer']['sdp'],
          data['answer']['type'],
        );

        await _peerConnection?.setRemoteDescription(answer);
      }
    });

    /// listen receiver candidate from firebase
    _personalCallRoomFB
        .getCandidatesStream(TypeCandidate.receiverCandidate)
        .listen(
      (snapshot) {
        for (var change in snapshot.docChanges) {
          if (change.type == DocumentChangeType.added) {
            Map<String, dynamic> data =
                change.doc.data() as Map<String, dynamic>;
            log('Got new remote ICE candidate: ${jsonEncode(data)}');
            _peerConnection!.addCandidate(
              RTCIceCandidate(
                data['candidate'],
                data['sdpMid'],
                data['sdpMLineIndex'],
              ),
            );
          }
        }
      },
    );

    return _roomId;
  }

  @override
  Future<void> joinRoom(String roomId) async {
    _personalCallRoomFB.createChatRoom(roomId);

    final roomSnapshot = await _personalCallRoomFB.roomRef.get();

    if (roomSnapshot.exists) {
      _peerConnection = await createPeerConnection(configuration);

      _registerPeerConnectionListeners();

      _localStream?.getTracks().forEach((track) {
        _peerConnection?.addTrack(track, _localStream!);
      });

      // Code for collecting ICE candidates below
      _peerConnection!.onIceCandidate = (RTCIceCandidate candidate) {
        if (candidate == null) {
          log('onIceCandidate: complete!');
          return;
        }
        log('onIceCandidate: ${candidate.toMap()}');
        _personalCallRoomFB.addCandidate(
            TypeCandidate.receiverCandidate, candidate);
      };
      // Code for collecting ICE candidate above

      _peerConnection?.onTrack = (RTCTrackEvent event) {
        log('Got remote track: ${event.streams[0]}');
        event.streams[0].getTracks().forEach((track) {
          log('Add a track to the remoteStream: $track');
          _remoteStream?.addTrack(track);
        });
      };

      // Code for creating SDP answer below
      var data = roomSnapshot.data() as Map<String, dynamic>;
      print('Got offer $data');
      var offer = data['offer'];
      await _peerConnection?.setRemoteDescription(
        RTCSessionDescription(offer['sdp'], offer['type']),
      );

      var answer = await _peerConnection!.createAnswer();
      log('Created Answer $answer', name: "answer");

      await _peerConnection!.setLocalDescription(answer);

      await _personalCallRoomFB.setAnswer(answer);

      _personalCallRoomFB
          .getCandidatesStream(TypeCandidate.senderCandidate)
          .listen((snapshot) {
        for (var document in snapshot.docChanges) {
          var data = document.doc.data() as Map<String, dynamic>;
          log(data.toString());
          log('Got new remote ICE candidate: $data');
          _peerConnection!.addCandidate(
            RTCIceCandidate(
              data['candidate'],
              data['sdpMid'],
              data['sdpMLineIndex'],
            ),
          );
        }
      });
    }
  }

  @override
  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo) async {
    try {
      var stream = await navigator.mediaDevices.getUserMedia({
        'video': true,
        'audio': true,
      });
      _localStream = stream;
      localVideo.srcObject = stream;

      remoteVideo.srcObject = await createLocalMediaStream('key');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> hangUp(RTCVideoRenderer localVideo) async {
    List<MediaStreamTrack> tracks = localVideo.srcObject!.getTracks();
    for (var track in tracks) {
      track.stop();
    }

    if (_remoteStream != null) {
      _remoteStream!.getTracks().forEach((track) => track.stop());
    }

    if (_peerConnection != null) _peerConnection!.close();

    //delete firebase
    if (_roomId != null) {
      var db = FirebaseFirestore.instance;
      var roomRef = db.collection('rooms').doc(_roomId);
      var calleeCandidates = await roomRef.collection('calleeCandidates').get();
      calleeCandidates.docs.forEach((document) => document.reference.delete());

      var callerCandidates = await roomRef.collection('callerCandidates').get();
      callerCandidates.docs.forEach((document) => document.reference.delete());

      await roomRef.delete();
    }

    _localStream?.dispose();
    _remoteStream?.dispose();
  }

  void _registerPeerConnectionListeners() {
    _peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      log('ICE gathering state changed: $state');
    };

    _peerConnection?.onConnectionState = (RTCPeerConnectionState state) {
      log('Connection state change: $state');
      _connectionState.add(state);
    };

    _peerConnection?.onSignalingState = (RTCSignalingState state) {
      log('Signaling state change: $state');
      _signalingState.add(state);
    };

    _peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      log('ICE connection state change: $state');
    };

    _peerConnection?.onAddStream = (MediaStream stream) {
      log("Add remote stream");
      _onAddRemoteMediaStream.add(stream);
      _remoteStream = stream;
    };

    _remoteStream?.onAddTrack = (MediaStreamTrack mediaStreamTrack) {
      _remoteTrackStream.add(mediaStreamTrack);
    };
    _remoteStream?.onRemoveTrack = (MediaStreamTrack mediaStreamTrack) {
      _remoteTrackStream.add(mediaStreamTrack);
    };
    _localStream?.onRemoveTrack = (mediaStreamTrack) {
      _localTrackStream.add(mediaStreamTrack);
    };
    _localStream?.onAddTrack = (mediaStreamTrack) {
      _localTrackStream.add(mediaStreamTrack);
    };
  }

  @override
  Stream<MediaStream> get addRemoteMediaStream =>
      _onAddRemoteMediaStream.stream;

  @override
  Stream<RTCPeerConnectionState> get connectionState => _connectionState.stream;

  @override
  Stream<RTCSignalingState> get signalingState => _signalingState.stream;

  @override
  Stream<MediaStreamTrack> get localTrackStream => _localTrackStream.stream;

  @override
  Stream<MediaStreamTrack> get remoteTrackStream => _remoteTrackStream.stream;
}
