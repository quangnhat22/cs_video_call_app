import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart';

abstract class AuthUseCase {
  Future<void> loginWitGoogle();
  Future<void> loginWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> logOut();
}

@Injectable(as: AuthUseCase)
class AuthUseCaeImpl extends AuthUseCase {
  final AuthRepository repo;

  AuthUseCaeImpl({required this.repo});

  @override
  Future<void> loginWitGoogle() async {
    await repo.loginWithGoogle();
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
}