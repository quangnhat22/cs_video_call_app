import 'auth_credential.dart';

/// An [AuthCredential] for authenticating via gmail.com.
class GoogleAuthCredential extends AuthCredential {
  const GoogleAuthCredential({
    this.accessToken,
    this.idToken,
  }) : super(_url);

  static const String _url = '/auth/gmail';

  @override
  Map<String, String?> asMap() {
    return {'gmail_token': accessToken};
  }

  /// The Gmail access token.
  final String? accessToken;
  final String? idToken;
}
