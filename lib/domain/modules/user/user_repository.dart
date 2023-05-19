import '../../entities/user_entity.dart';

abstract class UserRepository {
  Future<bool> updateSelf(
    String? name,
    String? avatar,
    String? gender,
    String? phone,
    DateTime? birthday,
    String? bio,
  );

  Future<void> getSelf();

  Future<bool> updateAvatar(String? filePath);

  Future<UserEntity?> getSelfFromLocal();

  Stream<UserEntity?> getStreamSelfFromLocal();

  Future<UserEntity?> getUserByEmail(String email);

  Future<UserEntity?> getUserById(String id);

  Future<void> clearBox();
}
