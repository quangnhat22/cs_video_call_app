import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../models/user_model.dart';

@LazySingleton()
class UserLocalDataSrc {
  static Box<UserModel>? _box;
  final String _userBox = "user_box";
  final String _userKeyName = "user_key_name";

  Future<Box<UserModel>> _openBox() async {
    _box ??= await Hive.openBox<UserModel>(_userBox);
    return _box!;
  }

  Future<void> setUser(UserModel user) async {
    await _openBox().then((box) async {
      await box.delete(_userKeyName);
      await box.put(_userKeyName, user);
      await getUser();
    });
  }

  Future<UserModel?> getUser() async {
    return await _openBox().then((box) async {
      return box.get(_userKeyName);
    });
  }

  Future<void> updateUser({
    String? name,
    String? address,
    String? avatar,
    String? phone,
    String? bio,
    DateTime? birthday,
    String? gender,
  }) async {
    return await _openBox().then((box) async {
      final currentUser = box.get(_userKeyName);
      if (currentUser != null) {
        final tempUser = currentUser.copyWith(
          name: name ?? currentUser.name,
          avatar: avatar ?? currentUser.avatar,
          phone: phone ?? currentUser.phone,
          birthday: birthday ?? currentUser.birthday,
          gender: gender ?? currentUser.gender,
          bio: bio ?? currentUser.bio,
        );
        setUser(tempUser);
      } else {
        final newUser = UserModel(
          id: "local-id",
          name: name,
          avatar: avatar,
          phone: phone,
          bio: bio,
          birthday: birthday,
          gender: gender,
        );
        setUser(newUser);
      }
    });
  }

  Stream<UserModel?> getUserStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _userKeyName).map((event) {
      return event.value;
    });
  }

  Future<void> deleteBoxUser() async {
    await _openBox().then((box) => box.clear());
  }
}
