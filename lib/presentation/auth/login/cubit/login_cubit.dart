import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/formz/email.dart';
import 'package:videocall/core/utils/formz/password.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthUseCase authUseCase})
      : _usecase = authUseCase,
        super(const LoginState.initial());

  final AuthUseCase _usecase;

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
        email: email, isValid: Formz.validate([email, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
        password: password, isValid: Formz.validate([state.email, password])));
  }

  Future<void> loginFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));
    try {
      await _usecase.loginWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          statusSubmit: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
