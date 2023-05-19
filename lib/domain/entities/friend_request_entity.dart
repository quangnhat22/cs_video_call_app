import '../../data/models/friend_request_model.dart';
import 'user_entity.dart';

class FriendRequestEntity {
  final UserEntity? sender;
  final UserEntity? receiver;
  final DateTime? createdAt;

  FriendRequestEntity({
    this.sender,
    this.receiver,
    this.createdAt,
  });

  static final friendRequestEmpty = FriendRequestEntity();

  static FriendRequestEntity convertToFriendRequestEntity({
    FriendRequestModel? model,
  }) {
    if (model == null) return friendRequestEmpty;
    return FriendRequestEntity(
      sender: UserEntity.convertToUserEntity(userModel: model.sender),
      receiver: UserEntity.convertToUserEntity(userModel: model.receiver),
      createdAt: model.createdAt,
    );
  }
}
