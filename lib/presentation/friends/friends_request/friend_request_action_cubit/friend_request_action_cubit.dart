import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/friend/friend_usecase.dart';

part 'friend_request_action_cubit.freezed.dart';
part 'friend_request_action_state.dart';

@Injectable()
class FriendRequestActionCubit extends Cubit<FriendRequestActionState> {
  FriendRequestActionCubit({required FriendUseCase friendUseCase})
      : _useCase = friendUseCase,
        super(const FriendRequestActionState.initial());

  final FriendUseCase _useCase;

  Future<void> recallRequest(String id) async {
    try {
      emit(const FriendActionLoading());
      final isSuccess = await _useCase.recallRequest(id);
      if (isSuccess) {
        emit(const FriendActionSuccess());
      } else {
        emit(const FriendActionFailure(message: "Something wrong! Try again."));
      }
    } catch (e) {
      emit(FriendActionFailure(message: e.toString()));
    }
  }

  Future<void> acceptRequest(String id) async {
    try {
      emit(const FriendActionLoading());
      final isSuccess = await _useCase.acceptReceiveRequest(id);
      if (isSuccess) {
        emit(const FriendActionSuccess());
      } else {
        emit(const FriendActionFailure(message: "Something wrong! Try again."));
      }
    } catch (e) {
      emit(FriendActionFailure(message: e.toString()));
    }
  }

  Future<void> rejectRequest(String id) async {
    try {
      emit(const FriendActionLoading());
      final isSuccess = await _useCase.rejectReceiveRequest(id);
      if (isSuccess) {
        emit(const FriendActionSuccess());
      } else {
        emit(const FriendActionFailure(message: "Something wrong! Try again."));
      }
    } catch (e) {
      emit(FriendActionFailure(message: e.toString()));
    }
  }
}
