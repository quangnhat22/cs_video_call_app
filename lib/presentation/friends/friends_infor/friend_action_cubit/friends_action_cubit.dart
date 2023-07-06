import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/friend/friend_usecase.dart';

part 'friends_action_cubit.freezed.dart';
part 'friends_action_state.dart';

@Injectable()
class FriendsActionCubit extends Cubit<FriendsActionState> {
  FriendsActionCubit({required FriendUseCase friendUC})
      : _friendUseCase = friendUC,
        super(const FriendsActionState.initial());

  final FriendUseCase _friendUseCase;

  Future<void> sentAddFriendRequest(String id) async {
    try {
      final isSentSuccess = await _friendUseCase.sendRequest(id);
      if (isSentSuccess) {
        emit(const SentAddRequestFriendSuccess());
      } else {
        emit(const SentAddRequestFriendFailure(
            message: "Something wrong! Try again"));
      }
    } catch (e) {
      emit(SentAddRequestFriendFailure(message: e.toString()));
    }
  }

  Future<void> deleteFriend(String id) async {
    try {
      final isSentSuccess = await _friendUseCase.deleteFriend(id);
      if (isSentSuccess) {
        emit(const SentAddRequestFriendSuccess());
      } else {
        emit(const SentAddRequestFriendFailure(
            message: "Something wrong! Try again"));
      }
    } catch (e) {
      emit(SentAddRequestFriendFailure(message: e.toString()));
    }
  }
}
