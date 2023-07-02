import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

abstract class AuthUseCase {
  Future<void> loginWitGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<bool> sendEmailVerify();

  Future<bool> checkEmailVerify();

  Future<void> logOut();

  Future<bool> checkIsLoggedIn();

  Stream<String?> checkAccessTokenStream();

  Stream<String?> checkRefreshTokenStream();

  Future<String?> sendResetPasswordCode();
}

@Injectable(as: AuthUseCase)
class AuthUseCaeImpl extends AuthUseCase {
  final AuthRepository repo;

  AuthUseCaeImpl({required this.repo});

  @override
  Future<void> loginWitGoogle() async {
    return await repo.loginWithGoogle();
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await repo.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await repo.signUpWithEmailAndPassword(email, password);
  }

  @override
  Future<void> logOut() {
    return repo.logOut();
  }

  @override
  Stream<String?> checkAccessTokenStream() {
    return repo.checkAccessTokenStream();
  }

  @override
  Stream<String?> checkRefreshTokenStream() {
    return repo.checkRefreshTokenStream();
  }

  @override
  Future<bool> sendEmailVerify() async {
    return repo.sendEmailVerify();
  }

  @override
  Future<bool> checkEmailVerify() async {
    return repo.checkEmailVerify();
  }

  @override
  Future<bool> checkIsLoggedIn() {
    return repo.checkIsLoggedIn();
  }

  @override
  Future<String?> sendResetPasswordCode() {
    return repo.sendResetPasswordCode();
  }
}
