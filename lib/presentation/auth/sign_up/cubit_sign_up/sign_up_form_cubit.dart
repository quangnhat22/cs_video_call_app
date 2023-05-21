import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/formz/confirmed_password.dart';
import 'package:videocall/core/utils/formz/email.dart';
import 'package:videocall/core/utils/formz/password.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

part 'sign_up_form_cubit.freezed.dart';
part 'sign_up_form_state.dart';

@Injectable()
class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit({required AuthRepository authRepo})
      : _repo = authRepo,
        super(const SignUpFormState.initial());

  final AuthRepository _repo;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          password,
          confirmedPassword,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));
    try {
      await _repo.signUpWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          statusSubmit: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
