part of welcome;

@Injectable()
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit({
    required AuthRepository authRepo,
  })  : _authRepo = authRepo,
        super(const WelcomeState.initial());

  final AuthRepository _authRepo;

  Future<void> loginWithGoogle() async {
    try {
      emit(const WelcomeState.signInWithGoogleInProgress());
      await _authRepo.loginWithGoogle();
      emit(const WelcomeState.signInWithGoogleSuccess());
    } catch (e) {
      emit(WelcomeState.signInFail(e.toString()));
    }
  }
}
