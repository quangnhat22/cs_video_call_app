import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_constant.dart';

part 'is_sent_email_cubit.freezed.dart';
part 'is_sent_email_state.dart';

@Injectable()
class IsSentEmailCubit extends Cubit<IsSentEmailState> {
  IsSentEmailCubit() : super(const IsSentEmailState.initial());

  void changeStatusIsSentEmail({bool value = false}) async {
    emit(state.copyWith(isSentEmail: value, disableVerify: true));
    await Future<void>.delayed(
      Duration(seconds: AppConstant.delaySendEmailTime),
      () {
        emit(
          state.copyWith(disableVerify: false),
        );
      },
    );
  }
}
