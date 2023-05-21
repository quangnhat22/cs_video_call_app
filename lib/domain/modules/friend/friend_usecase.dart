import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/friend/friend_repository.dart';

import '../../entities/friend_request_entity.dart';
import '../../entities/user_entity.dart';

abstract class FriendUseCase {
  Future<bool> sendRequest(String id);

  Future<List<UserEntity>> getListFriend();

  Future<bool> deleteFriend(String id);

  Future<bool> blockFriend(String id);

  Future<bool> unBlockFriend(String id);

  Future<List<FriendRequestEntity>> getSendRequest();

  Future<bool> recallRequest(String id);

  Future<List<FriendRequestEntity>> getReceiveRequest();

  Future<bool> acceptReceiveRequest(String userId);

  Future<bool> rejectReceiveRequest(String userId);
}

@Injectable(as: FriendUseCase)
class FriendUseCaseImpl extends FriendUseCase {
  FriendUseCaseImpl({required FriendRepository friendRepo})
      : _repo = friendRepo;

  final FriendRepository _repo;

  @override
  Future<bool> acceptReceiveRequest(String userId) async {
    return await _repo.acceptReceiveRequest(userId);
  }

  @override
  Future<bool> blockFriend(String id) async {
    return await _repo.blockFriend(id);
  }

  @override
  Future<bool> deleteFriend(String id) async {
    return await _repo.deleteFriend(id);
  }

  @override
  Future<List<UserEntity>> getListFriend() async {
    return await _repo.getListFriend();
  }

  @override
  Future<List<FriendRequestEntity>> getReceiveRequest() async {
    return await _repo.getReceiveRequest();
  }

  @override
  Future<List<FriendRequestEntity>> getSendRequest() async {
    return await _repo.getSendRequest();
  }

  @override
  Future<bool> recallRequest(String id) async {
    return await _repo.recallRequest(id);
  }

  @override
  Future<bool> rejectReceiveRequest(String userId) {
    return _repo.rejectReceiveRequest(userId);
  }

  @override
  Future<bool> sendRequest(String id) async {
    return _repo.sendRequest(id);
  }

  @override
  Future<bool> unBlockFriend(String id) {
    return _repo.unBlockFriend(id);
  }
}
