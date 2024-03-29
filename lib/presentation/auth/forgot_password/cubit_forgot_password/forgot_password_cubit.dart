import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/formz/email.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

@Injectable()
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthUseCase _authUseCase;

  ForgotPasswordCubit(this._authUseCase)
      : super(const ForgotPasswordState.initial());

  void emailChanged(String value) {
    final email = Email.dirty(value.trim());

    emit(state.copyWith(email: email, isValid: Formz.validate([email])));
  }

  Future<void> submitEmail() async {
    if (!state.isValid) return;
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));

    try {
      final isSuccess =
          await _authUseCase.forgotPassword(email: state.email.value);
      if (isSuccess) {
        emit(state.copyWith(
            statusSubmit: FormzSubmissionStatus.success, isSentEmail: true));
        emit(state.copyWith(
            statusSubmit: FormzSubmissionStatus.initial,
            email: const Email.pure()));
      } else {
        emit(state.copyWith(
            statusSubmit: FormzSubmissionStatus.failure, isSentEmail: true));
      }
    } catch (e) {
      emit(
        state.copyWith(
            statusSubmit: FormzSubmissionStatus.failure, isSentEmail: true),
      );
    }
  }
}
