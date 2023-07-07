import 'package:videocall/domain/entities/call_entity.dart';
import 'package:videocall/domain/entities/token_livekit_entity.dart';

abstract class FriendCallRepository {
  Future<TokenLiveKitEntity?> createFriendCall(String friendId);

  Future<String?> joinFriendCall(String callRoomId);

  Future<bool> abandonCall(String callRoomId);

  Future<bool> rejectCall(String callRoomId);

  Future<List<CallEntity>> getCallList(String? status, String? callee);
}
