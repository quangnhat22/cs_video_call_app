import '../models/login_data.dart';

abstract class AuthServices {
  Future<LoginData?> loginWithGoogle();
}
