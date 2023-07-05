abstract class AuthRepository {
  Future<void> loginWithGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> logOut();

  Future<bool> sendEmailVerify();

  Future<bool> checkEmailVerify();

  Future<bool> checkProfileUpdated();

  Future<bool> checkIsLoggedIn();

  Stream<String?> checkAccessTokenStream();

  Stream<String?> checkRefreshTokenStream();

  Future<String?> sendResetPasswordCode();

  Future<bool> updatePassword(String newPassword, String oldPassword);
}
