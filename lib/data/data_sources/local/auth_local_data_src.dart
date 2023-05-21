import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthLocalDataSrc {
  static Box? _box;
  final String _authBox = "auth_box";
  final String _accessTokenKeyName = "access_token_key";
  final String _refreshTokenKeyName = "refresh_token_key";
  final String _flagKeepUnAuth = "flag_keep_un_auth_name";

  Future<Box> _openBox() async {
    _box ??= await Hive.openBox(_authBox);
    return _box!;
  }

  Future<void> saveAuth(
      String accessToken, String refreshToken, bool flag) async {
    await _openBox().then((box) async {
      await box.put(_accessTokenKeyName, accessToken);
      await box.put(_refreshTokenKeyName, refreshToken);
      await box.put(_flagKeepUnAuth, flag);
    });
  }

  Future<void> setFlagKeepUnAuth(bool value) async {
    await _openBox().then((box) async {
      await box.put(_flagKeepUnAuth, value);
    });
  }

  Future<bool> checkTokenValid() async {
    final isKeepUnAuth = await getFlagKeepUnAuth();
    if (!isKeepUnAuth) {
      final accessToken = await getAccessToken();
      final refreshToken = await getRefreshToken();
      log(accessToken ?? "", name: "accessToken");
      log(refreshToken ?? "", name: "refreshToken");
      if (accessToken != null && refreshToken != null) {
        return true;
      }
    }
    return false;
  }

  Future<String?> getAccessToken() async {
    return await _openBox().then((box) {
      return box.get(_accessTokenKeyName, defaultValue: null);
    });
  }

  Stream<String?> getAccessTokenStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _accessTokenKeyName).map((event) {
      return event.value;
    });
  }

  Future<String?> getRefreshToken() async {
    return await _openBox().then((box) {
      return box.get(_refreshTokenKeyName, defaultValue: null);
    });
  }

  Future<bool> getFlagKeepUnAuth() async {
    return await _openBox().then((box) {
      return box.get(_flagKeepUnAuth, defaultValue: true);
    });
  }

  Stream<String?> getRefreshTokenStream() async* {
    final box = await _openBox();
    yield* box.watch(key: _refreshTokenKeyName).map((event) {
      return event.value;
    });
  }

  Future<void> deleteBoxAuth() async {
    // _openBox().then((box) {
    //   return print(
    //       box.get(_accessTokenKeyName, defaultValue: "no refresh token"));
    // });
    await Hive.box(_authBox).clear();
    // _openBox().then((box) {
    //   return print(
    //       box.get(_accessTokenKeyName, defaultValue: "no refresh token"));
    // });
  }
}
