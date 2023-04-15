import 'package:google_sign_in/google_sign_in.dart';
import 'package:videocall/modules/auth/auth_plugin/auth_plugin.dart';

class GoogleLogin implements AuthLoginBase {
  static final GoogleLogin _instance = GoogleLogin.internal();
  late GoogleSignIn _googleSignIn;

  factory GoogleLogin() {
    return _instance;
  }

  GoogleLogin.internal() {
    _googleSignIn = GoogleSignIn();
  }

  @override
  Future<bool> isLoggedIn() {
    return _googleSignIn.isSignedIn();
  }

  @override
  Future<AuthResult> login() async {
    await _googleSignIn.signOut();
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return AuthResult(LoginStatus.cancelledByUser, null);
      } else {
        final googleSignInAuthentication =
            await googleSignInAccount.authentication;
        return AuthResult(
          LoginStatus.loggedIn,
          googleSignInAuthentication.accessToken,
        );
      }
    } catch (err) {
      return AuthResult(LoginStatus.error, null);
    }
  }

  @override
  Future<void> logout() {
    return _googleSignIn.signOut();
  }
}
