import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/auth/auth_usecase.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'avatar_cubit.freezed.dart';
part 'avatar_state.dart';

@Injectable()
class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit({
    required UserUseCase userUc,
    required AuthUseCase authUC,
  })  : _userUC = userUc,
        _authUC = authUC,
        super(const AvatarState.initial()) {
    _userSub = _userUC.getStreamSelfFromLocal().listen((userLocal) {
      if (userLocal == null || userLocal.avatar == null) return;
      changeAvatarLocal(userLocal.avatar!);
    });
  }

  final UserUseCase _userUC;
  final AuthUseCase _authUC;

  late final StreamSubscription<UserEntity?> _userSub;

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

  void changeAvatarLocal(String urlImage) {
    emit(UpdateAvatarLocalSuccess(urlImage: urlImage));
  }

  Future<void> finishUpdateAvatar() async {
    await _authUC.setFlagKeepUnAuth(false);
  }

  @override
  Future<void> close() {
    _userSub.cancel();
    return super.close();
  }
}
