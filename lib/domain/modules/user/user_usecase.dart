import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

import '../../entities/user_entity.dart';

abstract class UserUseCase {
  Future<bool> updateSelf(
      {String? name,
      String? avatar,
      String? gender,
      String? phone,
      DateTime? birthday,
      String? bio});

  Future<bool> updateAvatar(String? filePath);

  Future<void> getSelf();

  Future<UserEntity?> getSelfFromLocal();

  Stream<UserEntity?> getStreamSelfFromLocal();

  Future<UserEntity?> getUserByEmail(String email);

  Future<UserEntity?> getUserById(String id);
}

@Injectable(as: UserUseCase)
class UserUseCaseImpl extends UserUseCase {
  final UserRepository repo;

  UserUseCaseImpl({required this.repo});

  @override
  Future<bool> updateSelf(
      {String? name,
      String? avatar,
      String? gender,
      String? phone,
      DateTime? birthday,
      String? bio}) async {
    return await repo.updateSelf(name, avatar, gender, phone, birthday, bio);
  }

  @override
  Future<void> getSelf() async {
    return await repo.getSelf();
  }

  @override
  Future<UserEntity?> getSelfFromLocal() async {
    return await repo.getSelfFromLocal();
  }

  @override
  Stream<UserEntity?> getStreamSelfFromLocal() {
    return repo.getStreamSelfFromLocal();
  }

  @override
  Future<UserEntity?> getUserByEmail(String email) {
    return repo.getUserByEmail(email);
  }

  @override
  Future<UserEntity?> getUserById(String id) {
    return repo.getUserById(id);
  }

  @override
  Future<bool> updateAvatar(String? filePath) {
    return repo.updateAvatar(filePath);
  }
}
