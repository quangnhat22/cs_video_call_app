import 'package:videocall/domain/entities/call_entity.dart';

abstract class FriendCallRepository {
  Future<String?> createFriendCall(String friendId);

  Future<String?> joinFriendCall(String callRoomId);

  Future<bool> abandonCall(String callRoomId);

  Future<bool> rejectCall(String callRoomId);

  Future<List<CallEntity>> getCallList(String? status, String? callee);
}
