import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'avatar_cubit.freezed.dart';
part 'avatar_state.dart';

@Injectable()
class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit({required UserUseCase userUc})
      : _userUC = userUc,
        super(const AvatarState.initial());

  final UserUseCase _userUC;

  Future<void> updateAvatar(String filePath) async {
    try {
      emit(const UpdateAvatarInProgress());
      final isUpdateSuccess = await _userUC.updateAvatar(filePath);
      if (isUpdateSuccess) {
        emit(const UpdateAvatarSuccess());
      } else {
        emit(const UpdateAvatarFailure(message: "Update fail! Try again"));
      }
    } catch (e) {
      emit(UpdateAvatarFailure(message: e.toString()));
    }
  }
}
