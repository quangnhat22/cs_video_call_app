import 'package:injectable/injectable.dart';
import 'package:videocall/core/services/notification_service.dart';
import 'package:videocall/core/utils/detect_device_info.dart';
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';
import 'package:videocall/data/data_sources/remote/service/auth_service.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';
import 'package:videocall/domain/modules/user/user_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
      {required AuthFirebase authFirebase,
      required AuthService authService,
      required AuthLocalDataSrc authLocalDataSrc,
      required NotificationService notificationService,
      required UserRepository userRepo})
      : _authFirebase = authFirebase,
        _authService = authService,
        _authLocalDataSrc = authLocalDataSrc,
        _notificationService = notificationService,
        _userRepo = userRepo;

  final UserRepository _userRepo;
  final AuthFirebase _authFirebase;
  final AuthService _authService;
  final AuthLocalDataSrc _authLocalDataSrc;
  final NotificationService _notificationService;

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
            data["access_token"]["token"],
            data["refresh_token"]["token"],
            false,
          );
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
      // clear local
      await _userRepo.clearBox();
      await _authLocalDataSrc.deleteBoxAuth();
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final deviceName = await DetectDeviceInfo.getDeviceName();
      final res = await _authService.register(email, password, deviceName);
      if (res.statusCode == 200) {
        final data = res.data["data"];
        await _authLocalDataSrc.saveAuth(
          data["access_token"]["token"],
          data["refresh_token"]["token"],
          true,
        );
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
  Future<void> removeFlagSignUpNavigator() async {
    return await _authLocalDataSrc.setFlagKeepUnAuth(true);
  }

  @override
  Future<bool> sendEmailVerify() async {
    try {
      final res = await _authService.sendVerifyEmail();
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
