import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/formz/email.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';

part 'send_email_state.dart';
part 'send_email_cubit.freezed.dart';

@Injectable()
class SendEmailCubit extends Cubit<SendEmailState> {
  SendEmailCubit({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const SendEmailState.initial());

  final AuthUseCase _authUseCase;

  void emailChanged(String value) {
    final email = Email.dirty(value.trim());

    emit(state.copyWith(email: email, isValid: Formz.validate([email])));
  }

  Future<void> submitEmail() async {
    emit(state.copyWith(statusSubmit: FormzSubmissionStatus.inProgress));

    try {
      await _authUseCase.sendResetPasswordCode();
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
