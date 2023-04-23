import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/detect_device_info.dart';
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';
import 'package:videocall/data/data_sources/remote/service/auth_service.dart';
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthFirebase authFirebase,
    required AuthService authService,
    required AuthLocalDataSrc authLocalDataSrc,
  })  : _authFirebase = authFirebase,
        _authService = authService,
        _authLocalDataSrc = authLocalDataSrc;

  final AuthFirebase _authFirebase;
  final AuthService _authService;
  final AuthLocalDataSrc _authLocalDataSrc;

  @override
  Future<bool> checkIsLoggedIn() async {
    final isTokenLocalAvailable = await _authLocalDataSrc.checkTokenValid();
    return isTokenLocalAvailable ? true : false;
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      final userCredential = await _authFirebase.signInWithGoogle();
      final idToken = await userCredential.user?.getIdToken();
      if (idToken != null) {
        // get device name
        final deviceName = await DetectDeviceInfo.getDeviceName();
        //call api
        final res = await _authService.loginWithFirebase(idToken, deviceName);
        // handle res data
        if (res.statusCode == 200) {
          final data = res.data["data"];
          await _authLocalDataSrc.saveAuth(
              data["access_token"]["token"], data["refresh_token"]["token"]);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logOut() async {
    await _authLocalDataSrc.deleteBoxAuth();
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Stream<String?> checkAccessTokenStream() {
    return _authLocalDataSrc.checkAccessTokenStream();
  }
}
