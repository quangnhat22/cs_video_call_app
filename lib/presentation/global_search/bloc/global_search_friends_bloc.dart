import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/friend/friend_usecase.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'global_search_friends_event.dart';
part 'global_search_friends_state.dart';
part 'global_search_friends_bloc.freezed.dart';

class GlobalSearchFriendsBloc
    extends Bloc<GlobalSearchFriendsEvent, GlobalSearchFriendsState> {
  GlobalSearchFriendsBloc(
      {required FriendUseCase useCase, required UserUseCase userUseCase})
      : _useCase = useCase,
        super(const _Initial()) {
    on<GlobalSearchFriendsEvent>((event, emit) {
      started:
      (event) => _started(event, emit);
    });
  }

  final FriendUseCase _useCase;

  Future<void> _started(
      _Started event, Emitter<GlobalSearchFriendsState> emit) async {
    try {
      emit(const GlobalSearchFriendsLoading());
      final friends = await _useCase.getListFriend();
      emit(GlobalSearchFriendsSuccess(friends: friends));
    } catch (e) {
      emit(GlobalSearchFriendsFailure(message: e.toString()));
    }
  }
}
