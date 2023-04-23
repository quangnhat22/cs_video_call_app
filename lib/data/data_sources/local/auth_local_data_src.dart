import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthLocalDataSrc {
  static Box? _box;
  final String _authBox = "auth_box";
  final String _accessTokenKeyName = "access_token_key";
  final String _refreshTokenKeyName = "refresh_token_key";

  Future<Box> _openBox() async {
    _box ??= await Hive.openBox(_authBox);
    return _box!;
  }

  Future<void> saveAuth(String accessToken, String refreshToken) async {
    await _openBox().then((box) async {
      await box.put(_accessTokenKeyName, accessToken);
      await box.put(_refreshTokenKeyName, refreshToken);
    });
  }

  Future<bool> checkTokenValid() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    log(accessToken ?? "", name: "accessToken");
    log(refreshToken ?? "", name: "refreshToken");
    if (accessToken != null && refreshToken != null) {
      return true;
    }
    return false;
  }

  Stream<String?> checkAccessTokenStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _accessTokenKeyName).map((event) {
      return event.value;
    });
  }

  Future<String?> getAccessToken() async {
    return await _openBox().then((box) {
      return box.get(_accessTokenKeyName, defaultValue: null);
    });
  }

  Future<String?> getRefreshToken() async {
    return await _openBox().then((box) {
      return box.get(_refreshTokenKeyName, defaultValue: null);
    });
  }

  Future<void> deleteBoxAuth() async {
    // getBox().then((box) {
    //   return print(
    //       box.get(refreshTokenKeyName, defaultValue: "no refresh token"));
    // });
    await Hive.box(_authBox).clear();
    // _openBox().then((box) {
    //   return print(
    //       box.get(_accessTokenKeyName, defaultValue: "no refresh token"));
    // });
  }
}
