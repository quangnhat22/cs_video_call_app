import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/firebase/auth_firebase.dart';
import 'package:videocall/domain/modules/auth/repositories/auth_repostiory.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthFirebase authFirebase})
      : _authFirebase = authFirebase;

  final AuthFirebase _authFirebase;

  @override
  Future<void> loginWithGoogle() async {
    _authFirebase.signInWithGoogle();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
