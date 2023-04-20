part of welcome;

@Injectable()
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit({
    required AuthServices authServices,
  })  : _auth = authServices,
        super(WelcomeInitial());

  final AuthServices _auth;

  Future<LoginState> loginWithGoogle() async {
    return _signIn(_auth.loginWithGoogle());
  }

  Future<LoginState> _signIn(Future<LoginData?> signInMethod) async {
    try {
      final loginData = await signInMethod;
      if (loginData != null) {
        // return loginData.isNew ? LoginState.newUser : LoginState.success;
        return LoginState.success;
      }
      return LoginState.fail;
    } catch (e) {
      rethrow;
    }
  }
}
