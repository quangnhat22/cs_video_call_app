import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/modules/friend/friend_usecase.dart';

part 'friends_contact_bloc.freezed.dart';
part 'friends_contact_event.dart';
part 'friends_contact_state.dart';

@Injectable()
class FriendsContactBloc
    extends Bloc<FriendsContactEvent, FriendsContactState> {
  FriendsContactBloc({required FriendUseCase useCase})
      : _useCase = useCase,
        super(const _Initial()) {
    on<FriendsContactEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        refreshed: (event) => _refreshed(event, emit),
      );
    });
  }

  final FriendUseCase _useCase;

  Future<void> _started(
      _Started event, Emitter<FriendsContactState> emit) async {
    try {
      emit(const FriendsContactLoading());
      final friends = await _useCase.getListFriend();
      emit(FriendsContactSuccess(friends: friends));
    } catch (e) {
      emit(FriendsContactFailure(message: e.toString()));
    }
  }

  Future<void> _refreshed(
      FriendsContactRefreshed event, Emitter<FriendsContactState> emit) async {
    try {
      final friends = await _useCase.getListFriend();
      emit(FriendsContactSuccess(friends: friends));
    } catch (e) {
      emit(FriendsContactFailure(message: e.toString()));
    }
  }
}
