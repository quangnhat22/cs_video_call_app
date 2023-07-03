import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'avatar_cubit.freezed.dart';
part 'avatar_state.dart';

@Injectable()
class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit({
    required UserUseCase userUc,
  })  : _userUC = userUc,
        super(const AvatarState.initial()) {
    _userSub = _userUC.getStreamSelfFromLocal().listen((userLocal) {
      if (userLocal == null || userLocal.avatar == null) return;
      changeAvatarLocal(userLocal.avatar!);
    });
  }

  final UserUseCase _userUC;

  late final StreamSubscription<UserEntity?> _userSub;

  void initValue() async {
    final userInfo = await _userUC.getSelfFromLocal();
    emit(state.copyWith(urlImage: userInfo?.avatar));
  }

  Future<void> updateAvatar(String filePath) async {
    try {
      emit(state.copyWith(statusUpload: StatusUploadAvatar.inProgress));
      final isUpdateSuccess = await _userUC.updateAvatar(filePath);
      if (isUpdateSuccess) {
        emit(state.copyWith(statusUpload: StatusUploadAvatar.success));
      } else {
        emit(state.copyWith(statusUpload: StatusUploadAvatar.fail));
      }
    } catch (_) {
      emit(state.copyWith(statusUpload: StatusUploadAvatar.fail));
    }
  }

  void changeAvatarLocal(String urlImage) {
    emit(state.copyWith(urlImage: urlImage));
  }

  @override
  Future<void> close() {
    _userSub.cancel();
    return super.close();
  }
}
