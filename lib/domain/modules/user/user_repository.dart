abstract class UserRepository {
  Future<void> updateSelf(String? name, String? avatar, String? address,
      String? gender, String? phone, String? birthday);
}
