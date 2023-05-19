import '../../entities/friend_request_entity.dart';
import '../../entities/user_entity.dart';

abstract class FriendRepository {
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
