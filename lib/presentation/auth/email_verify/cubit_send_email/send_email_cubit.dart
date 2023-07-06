import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';

part 'send_email_state.dart';
part 'send_email_cubit.freezed.dart';

@Injectable()
class SendEmailCubit extends Cubit<SendEmailState> {
  SendEmailCubit({
    required AuthUseCase authUseCase,
  })  : _useCase = authUseCase,
        super(const SendEmailState.initial());

  final AuthUseCase _useCase;

  void pageInited(String? email) {
    emit(state.copyWith(email: email));
  }

  Future<void> sendEmail() async {
    try {
      emit(SendEmailInProgress(email: state.email));
      final isSendEmailSuccess = await _useCase.sendEmailVerify();
      if (isSendEmailSuccess) {
        emit(SendEmailSuccess(email: state.email));
        return;
      }
      emit(SendEmailFailure(email: state.email, message: "Sent fail"));
    } catch (e) {
      emit(SendEmailFailure(email: state.email, message: e.toString()));
    }
  }

  Future<void> checkEmailVerify() async {
    try {
      emit(SendEmailVerifying(email: state.email));
      final res = await _useCase.checkEmailVerify();
      if (res) {
        emit(SendEmailVerified(email: state.email));
      } else {
        emit(SendEmailNotVerified(email: state.email));
      }
    } catch (e) {
      emit(SendEmailNotVerified(email: state.email));
    }
  }

  Future<void> logOut() async {
    await _useCase.logOut();
  }
}
