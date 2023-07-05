import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/detect_device_info.dart';
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';
import 'package:videocall/data/data_sources/local/local_data_src.dart';
import 'package:videocall/data/data_sources/remote/service/auth_service.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';
import 'package:videocall/services/notification_service.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._localDataSource, this._userRepo, this._authService,
      this._authFirebase, this._authLocalDataSrc, this._notificationService);

  final UserRepository _userRepo;
  final AuthFirebase _authFirebase;
  final AuthService _authService;
  final AuthLocalDataSrc _authLocalDataSrc;
  final NotificationService _notificationService;
  final LocalDataSource _localDataSource;

  @override
  Future<bool> checkIsLoggedIn() async {
    final isTokenLocalAvailable = await _authLocalDataSrc.checkTokenValid();
    return isTokenLocalAvailable;
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      final userCredential = await _authFirebase.signInWithGoogle();
      final idToken = await userCredential.user?.getIdToken();
      if (idToken != null) {
        // get device name
        final deviceName = await DetectDeviceInfo.getDeviceName();
        final fcmToken = await _getFCMToken();
        //call api
        final res =
            await _authService.loginWithFirebase(idToken, deviceName, fcmToken);
        // handle res data
        if (res.statusCode == 200) {
          final data = res.data["data"];
          await _authLocalDataSrc.saveAuth(
              data["access_token"]["token"], data["refresh_token"]["token"]);

          await _userRepo.getSelf();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _authService.logOut();
      await _authFirebase.logOut();
    } finally {
      await _localDataSource.deleteAllLocal();
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      final deviceName = await DetectDeviceInfo.getDeviceName();
      final fcmToken = await _getFCMToken();

      final res =
          await _authService.login(email, password, deviceName, fcmToken);

      if (res.statusCode == 200) {
        final data = res.data["data"];

        await _authLocalDataSrc.saveAuth(
            data["access_token"]["token"], data["refresh_token"]["token"]);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final deviceName = await DetectDeviceInfo.getDeviceName();
      final fcmToken = await _getFCMToken();

      final res =
          await _authService.register(email, password, deviceName, fcmToken);
      if (res.statusCode == 200) {
        final data = res.data["data"];
        await _authLocalDataSrc.saveAuth(
            data["access_token"]["token"], data["refresh_token"]["token"]);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<String?> checkAccessTokenStream() {
    return _authLocalDataSrc.getAccessTokenStream();
  }

  @override
  Stream<String?> checkRefreshTokenStream() {
    return _authLocalDataSrc.getRefreshTokenStream();
  }

  Future<String?> _getFCMToken() async {
    return await _notificationService.getFirebaseMessagingToken();
  }

  @override
  Future<bool> sendEmailVerify() async {
    try {
      final res = await _authService.sendVerifyEmail();
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> checkEmailVerify() async {
    try {
      final res = await _authService.checkEmailVerified();
      if (res.statusCode == 200) {
        return res.data["data"];
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> sendResetPasswordCode() async {
    try {
      final res = await _authService.sendEmailResetPasswordCode();
      if (res.statusCode == 200) {
        return res.data["data"];
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> checkProfileUpdated() async {
    try {
      final userEntity = await _userRepo.getSelf();
      return userEntity.isProfileUpdated;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
