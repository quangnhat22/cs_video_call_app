import '../../data/models/user_model.dart';

class UserEntity {
  final String id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? phone;
  final String? gender;
  final String? bio;
  final DateTime? birthday;
  final int? commonFriendCount;
  final DateTime? lastSeenAt;
  final String relation;

  UserEntity({
    required this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.gender,
    this.bio,
    this.birthday,
    this.commonFriendCount = 0,
    this.lastSeenAt,
    this.relation = "non",
  });

  static final userEntityEmpty = UserEntity(id: "-1");

  static UserEntity convertToUserEntity({
    UserModel? userModel,
  }) {
    if (userModel == null) return userEntityEmpty;
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
      avatar: userModel.avatar,
      email: userModel.email,
      phone: userModel.phone,
      gender: userModel.gender,
      bio: userModel.bio,
      birthday: userModel.birthday,
      commonFriendCount: userModel.commonFriendCount,
      lastSeenAt: userModel.lastSeenAt,
      relation: userModel.relation ?? "non",
    );
  }
}
