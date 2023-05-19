import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/modules/user/user_repository.dart';

part 'find_friend_bloc.freezed.dart';
part 'find_friend_event.dart';
part 'find_friend_state.dart';

@Injectable()
class FindFriendBloc extends Bloc<FindFriendEvent, FindFriendState> {
  FindFriendBloc({required UserRepository userRepo})
      : _userRepo = userRepo,
        super(const _Initial()) {
    on<FindFriendEvent>((event, emit) async {
      await event.map(
          submitButton: (event) async => _submitButton(event, emit));
    });
  }

  final UserRepository _userRepo;

  Future<void> _submitButton(
      SubmitButtonFindFriend event, Emitter<FindFriendState> emit) async {
    if (event.email.trim() == "") return;
    try {
      emit(const FindFriendInProgress());
      final userRes = await _userRepo.getUserByEmail(event.email);
      if (userRes != null) {
        emit(FindFriendSucess(userResult: userRes));
      } else {
        emit(const FindFriendNotFound());
      }
    } catch (e) {
      emit(const FindFriendNotFound());
    }
  }
}
