import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

import '../../../../domain/entities/user_entity.dart';

part 'friend_info_cubit.freezed.dart';
part 'friend_info_state.dart';

@Injectable()
class FriendInfoCubit extends Cubit<FriendInfoState> {
  final UserUseCase _useCase;

  FriendInfoCubit(this._useCase) : super(const FriendInfoState.initial());

  late final String? _friendId;

  void pageInited(String friendId) async {
    try {
      _friendId = friendId;
      emit(const GetInfoFriendInProgress());
      final friendInfo = await _useCase.getUserById(friendId);
      if (friendInfo != null) {
        emit(GetInfoFriendInSuccess(friendInfo: friendInfo));
      } else {
        emit(const GetInfoFriendInFail());
      }
    } catch (_) {
      emit(const GetInfoFriendInFail());
    }
  }

  void pageRefreshed() async {
    try {
      if (_friendId == null) return;
      
      final friendInfo = await _useCase.getUserById(_friendId!);
      if (friendInfo != null) {
        emit(GetInfoFriendInSuccess(friendInfo: friendInfo));
      } else {
        emit(const GetInfoFriendInFail());
      }
    } catch (_) {
      emit(const GetInfoFriendInFail());
    }
  }
}
