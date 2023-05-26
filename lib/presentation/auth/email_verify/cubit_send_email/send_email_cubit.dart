import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/auth/auth_repostiory.dart';

part 'send_email_state.dart';
part 'send_email_cubit.freezed.dart';

@Injectable()
class SendEmailCubit extends Cubit<SendEmailState> {
  SendEmailCubit({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(const SendEmailState.initial());

  final AuthRepository _authRepo;

  Future<void> sendEmail() async {
    try {
      emit(const SendEmailInProgress());
      final isSendEmailSuccess = await _authRepo.sendEmailVerify();
      if (isSendEmailSuccess) {
        emit(const SendEmailSuccess());
        return;
      }
      emit(const SendEmailFailure(message: "Sent fail"));
    } catch (e) {
      emit(SendEmailFailure(message: e.toString()));
    }
  }
}
