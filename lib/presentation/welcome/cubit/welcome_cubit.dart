import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

part 'welcome_cubit.freezed.dart';
part 'welcome_state.dart';

@Injectable()
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(const WelcomeState.initial());

  final AuthRepository _authRepo;

  Future<void> loginWithGoogle() async {
    try {
      emit(const WelcomeState.signInWithGoogleInProgress());
      await _authRepo.loginWithGoogle();
      // emit(const WelcomeState.signInWithGoogleSuccess());
    } catch (e) {
      emit(WelcomeState.signInFail(e.toString()));
    }
  }
}
