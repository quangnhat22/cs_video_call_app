import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/formz/confirmed_password.dart';
import 'package:videocall/core/utils/formz/password.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

@Injectable()
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const ChangePasswordState.initial());

  final AuthUseCase _authUseCase;

  void oldPasswordChanged(String value) {
    final oldPassword = Password.dirty(value);
    emit(state.copyWith(
        oldPassword: oldPassword,
        isValid: Formz.validate(
            [oldPassword, state.newPassword, state.confirmPassword])));
  }

  void newPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    final confirmPassword = ConfirmedPassword.dirty(
      password: newPassword.value,
      value: state.confirmPassword.value,
    );

    emit(state.copyWith(
        newPassword: newPassword,
        isValid:
            Formz.validate([newPassword, state.oldPassword, confirmPassword])));
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmedPassword.dirty(
        password: state.newPassword.value, value: value);
    emit(state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate(
            [confirmPassword, state.newPassword, state.oldPassword])));
  }

  Future<void> changePasswordFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));

    try {
      final isChangedSuccess = await _authUseCase.updatePassword(
          state.newPassword.value, state.oldPassword.value);
      if (isChangedSuccess) {
        emit(state.copyWith(statusSubmit: FormzSubmissionStatus.success));
      } else {
        emit(
          state.copyWith(
            statusSubmit: FormzSubmissionStatus.failure,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          statusSubmit: FormzSubmissionStatus.failure,
        ),
      );
    }
  }
}
