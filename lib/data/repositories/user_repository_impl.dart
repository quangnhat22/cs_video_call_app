import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/remote/service/user_service.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserService userService;

  UserRepositoryImpl({required this.userService});

  @override
  Future<void> updateSelf(
    String? name,
    String? avatar,
    String? address,
    String? gender,
    String? phone,
    String? birthday,
  ) async {
    try {
      await userService.updateSelf(
          name, avatar, address, gender, phone, birthday);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
