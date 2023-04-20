import '../auth_credential/auth_credential.dart';
import '../auth_credential/google_auth_credential.dart';

class GoogleAuthProvider {
  static AuthCredential getCredential({String? accessToken, String? idToken}) {
    return GoogleAuthCredential(
      accessToken: accessToken,
      idToken: idToken,
    );
  }
}
