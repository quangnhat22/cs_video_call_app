part of welcome;

@Injectable()
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit({
    required AuthRepository authRepo,
  })  : _authRepo = authRepo,
        super(WelcomeInitial());

  final AuthRepository _authRepo;

  Future<void> loginWithGoogle() async {
    try {
      await _authRepo.loginWithGoogle();
      emit(WelcomeSignInWithGoogleSuccess());
    } catch (e) {
      emit(WelcomeSignInWithGoogleFailure(message: e.toString()));
    }
  }
}
