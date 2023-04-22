abstract class AuthRepository {
  Future<bool> checkIsLoggedIn();
  Future<void> loginWithGoogle();
  Future<void> loginWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> logOut();
}
