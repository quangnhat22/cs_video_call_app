import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthLocalDataSrc {
  late final Box? _box;
  final String authBox = "auth_box";
  final String accessTokenKeyName = "access_token_key";
  final String refreshTokenKeyName = "refresh_token_key";

  AuthLocalDataSrc() {
    _openBox();
  }

  Future<void> _openBox() async {
    _box = await Hive.openBox(authBox);
  }

  Future<void> saveAuth(String accessToken, String refreshToken) async {
    await _box?.put(accessTokenKeyName, accessToken);
    await _box?.put(refreshTokenKeyName, refreshToken);
  }

  Future<String> getAccessToken() async {
    return _box?.get(accessTokenKeyName, defaultValue: "no access token") ?? "";
  }

  Future<String> getRefreshToken() async {
    return _box?.get(refreshTokenKeyName, defaultValue: "no refresh token") ??
        "";
  }

  Future<void> deleteBoxAuth() async {
    // getBox().then((box) {
    //   return print(
    //       box.get(refreshTokenKeyName, defaultValue: "no refresh token"));
    // });
    await Hive.box(authBox).clear();
    // getBox().then((box) {
    //   return print(
    //       box.get(refreshTokenKeyName, defaultValue: "no refresh token"));
    // });
  }
}
