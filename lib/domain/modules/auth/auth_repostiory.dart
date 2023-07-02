abstract class AuthRepository {
  Future<void> loginWithGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> logOut();

  Future<bool> sendEmailVerify();

  Future<bool> checkEmailVerify();

  Future<bool> checkIsLoggedIn();

  Stream<String?> checkAccessTokenStream();

  Stream<String?> checkRefreshTokenStream();

  Future<String?> sendResetPasswordCode();
}
