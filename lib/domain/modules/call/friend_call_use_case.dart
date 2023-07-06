import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/call_entity.dart';

import 'friend_call_repository.dart';

abstract class FriendCallUseCase {
  Future<String?> createFriendCall(String friendId);

  Future<String?> joinFriendCall(String callRoomId);

  Future<bool> abandonCall(String callRoomId);

  Future<bool> rejectCall(String callRoomId);

  Future<List<CallEntity>> getCallList(String? status, String? callee);
}

@Injectable(as: FriendCallUseCase)
class FriendCallUseCaseImpl extends FriendCallUseCase {
  final FriendCallRepository _repo;

  FriendCallUseCaseImpl(this._repo);

  @override
  Future<String?> createFriendCall(String friendId) async {
    return await _repo.createFriendCall(friendId);
  }

  @override
  Future<String?> joinFriendCall(String callRoomId) {
    return _repo.joinFriendCall(callRoomId);
  }

  @override
  Future<bool> abandonCall(String callRoomId) {
    return _repo.abandonCall(callRoomId);
  }

  @override
  Future<bool> rejectCall(String callRoomId) {
    return _repo.rejectCall(callRoomId);
  }

  @override
  Future<List<CallEntity>> getCallList(String? status, String? callee) async {
    return await _repo.getCallList(status, callee);
  }
}