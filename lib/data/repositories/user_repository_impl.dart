import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/firebase/asset_firebase.dart';
import 'package:videocall/data/data_sources/remote/service/user_service.dart';
import 'package:videocall/data/models/user_model.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

import '../../domain/entities/user_entity.dart';
import '../data_sources/local/user_local_data_src.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserService _service;
  final UserLocalDataSrc _local;
  final AssetFirebase _assetFirebase;

  UserRepositoryImpl(
      {required UserService userService,
      required UserLocalDataSrc userLocal,
      required AssetFirebase assetFirebase})
      : _service = userService,
        _local = userLocal,
        _assetFirebase = assetFirebase;

  @override
  Future<bool> updateSelf(String? name, String? avatar, String? gender,
      String? phone, DateTime? birthday, String? bio) async {
    try {
      final res = await _service.updateSelf(
          name: name,
          avatar: avatar,
          gender: gender,
          phone: phone,
          birthday: birthday,
          bio: bio);
      if (res.statusCode == 200) {
        await _local.updateUser(
          name: name,
          avatar: avatar,
          gender: gender,
          phone: phone,
          birthday: birthday,
          bio: bio,
        );
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> getSelf() async {
    try {
      final res = await _service.getSelf();

      // save to local
      if (res.statusCode == 200) {
        final userInfo = UserModel.fromJson(res.data["data"]);
        _local.setUser(userInfo);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserEntity?> getSelfFromLocal() async {
    final userModel = await _local.getUser();
    if (userModel == null) return null;
    final userEntity = UserEntity.convertToUserEntity(userModel: userModel);
    return userEntity;
  }

  @override
  Future<UserEntity?> getUserByEmail(String email) async {
    try {
      final res = await _service.getUserDetailByEmail(email);
      if (res.statusCode == 200) {
        final resultFriend = UserModel.fromJson(res.data["data"]);
        return UserEntity.convertToUserEntity(userModel: resultFriend);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserEntity?> getUserById(String id) async {
    try {
      final res = await _service.getUserDetailById(id);
      if (res.statusCode == 200) {
        final resultFriend = UserModel.fromJson(res.data["data"]);
        return UserEntity.convertToUserEntity(userModel: resultFriend);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<UserEntity?> getStreamSelfFromLocal() {
    return _local.getUserStream().map((userModel) {
      if (userModel == null) return null;
      return UserEntity.convertToUserEntity(userModel: userModel);
    });
  }

  @override
  Future<void> clearBox() async {
    await _local.deleteBoxUser();
  }

  @override
  Future<bool> updateAvatar(String? filePath) async {
    try {
      if (filePath == null) return false;
      final urlImage = await _assetFirebase.uploadFile(filePath);
      final res = await _service.updateSelf(
        avatar: urlImage,
      );
      if (res.statusCode == 200) {
        await _local.updateUser(
          avatar: urlImage,
        );
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
