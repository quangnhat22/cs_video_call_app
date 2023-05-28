import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:injectable/injectable.dart';

enum TypeCandidate {
  senderCandidate("SenderCandidates"), // caller candidate
  receiverCandidate("ReceiverCandidates"); // callee candidate

  const TypeCandidate(this.value);

  final String value;
}

@Injectable()
class PersonalCallRoomFirebase {
  late final DocumentReference<Map<String, dynamic>> _roomRef;
  late final CollectionReference<Map<String, dynamic>>
      _senderCandidateCollection;
  late final CollectionReference<Map<String, dynamic>>
      _receiverCandidateCollection;

  DocumentReference<Map<String, dynamic>> get roomRef => _roomRef;

  String createChatRoom(String? roomId) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    _roomRef = db.collection('rooms').doc(roomId);

    _senderCandidateCollection =
        _roomRef.collection(TypeCandidate.senderCandidate.value);
    _receiverCandidateCollection =
        _roomRef.collection(TypeCandidate.senderCandidate.value);
    return _roomRef.id;
  }

  void addCandidate(TypeCandidate type, RTCIceCandidate candidate) {
    switch (type) {
      case TypeCandidate.senderCandidate:
        _senderCandidateCollection.add(candidate.toMap());
        break;

      case TypeCandidate.receiverCandidate:
        _receiverCandidateCollection.add(candidate.toMap());
        break;
    }
  }

  Future<void> setOffer(RTCSessionDescription offer) async {
    Map<String, dynamic> roomWithOffer = {'offer': offer.toMap()};
    await _roomRef.set(roomWithOffer);
  }

  Future<void> setAnswer(RTCSessionDescription answer) async {
    Map<String, dynamic> roomWithAnswer = {
      'answer': {'type': answer.type, 'sdp': answer.sdp}
    };
    await _roomRef.update(roomWithAnswer);
  }

  Stream<DocumentSnapshot<Object?>> getChatRoomStream() {
    return _roomRef.snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCandidatesStream(
      TypeCandidate type) {
    return _roomRef.collection(type.value).snapshots();
  }
}
