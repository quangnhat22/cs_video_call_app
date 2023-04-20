enum LoginStatus {
  /// The login was successful and the user is now logged in.
  loggedIn,

  /// The user cancelled the login flow, usually by closing the Facebook
  /// login dialog.
  cancelledByUser,

  /// The Facebook login completed with an error and the user couldn't log
  /// in for some reason.
  error,
}

class AuthResult {
  LoginStatus loginStatus;
  String? accessToken;
  String? idToken;
  String? errMessage;

  AuthResult({
    required this.loginStatus,
    this.errMessage,
    this.accessToken,
    this.idToken,
  });
}

abstract class AuthLoginBase {
  AuthLoginBase.internal();
  Future<AuthResult> login();
  Future<bool> isLoggedIn();
  Future<void> logout();
}
