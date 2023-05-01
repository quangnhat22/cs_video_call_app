import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

abstract class UserUseCase {
  Future<void> updateSelf(
      {String? name,
      String? avatar,
      String? address,
      String? gender,
      String? phone,
      String? birthday});
}

@Injectable(as: UserUseCase)
class UserUseCaseImpl extends UserUseCase {
  final UserRepository userRepo;

  UserUseCaseImpl({required this.userRepo});

  @override
  Future<void> updateSelf(
      {String? name,
      String? avatar,
      String? address,
      String? gender,
      String? phone,
      String? birthday}) async {
    return await userRepo.updateSelf(
        name, avatar, address, gender, phone, birthday);
  }
}
