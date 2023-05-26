abstract class AuthRepository {
  Future<void> loginWithGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> logOut();

  Future<void> setFlagKeepUnAuth(bool? isKeepUnAuth);

  Future<bool> sendEmailVerify();

  Future<bool> checkIsLoggedIn();

  Stream<String?> checkAccessTokenStream();

  Stream<String?> checkRefreshTokenStream();

  Stream<bool?> checkFlagKeepUnAuthStream();
}
