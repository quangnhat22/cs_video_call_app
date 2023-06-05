import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'group_request_action_state.dart';
part 'group_request_action_cubit.freezed.dart';

@Injectable()
class GroupRequestActionCubit extends Cubit<GroupRequestActionState> {
  GroupRequestActionCubit({required GroupUseCase groupUseCase})
      : _groupUseCase = groupUseCase,
        super(const GroupRequestActionState.initial());

  final GroupUseCase _groupUseCase;

  Future<void> recallSentRequest(String groupId, String friendId) async {
    try {
      emit(const GroupActionLoading());

      final isSuccess =
          await _groupUseCase.recallSentRequest(groupId, friendId);
      if (isSuccess) {
        emit(const GroupActionSuccess());
      } else {
        emit(const GroupActionFailure(
            message: 'Something went wrong, please try again'));
      }
    } catch (e) {
      emit(GroupActionFailure(message: e.toString()));
    }
  }

  Future<void> rejectReceivedRequest(String groupId) async {
    try {
      emit(const GroupActionLoading());

      final isSuccess = await _groupUseCase.rejectReceivedRequest(groupId);
      if (isSuccess) {
        emit(const GroupActionSuccess());
      } else {
        emit(const GroupActionFailure(
            message: 'Something went wrong, please try again'));
      }
    } catch (e) {
      emit(GroupActionFailure(message: e.toString()));
    }
  }

  Future<void> acceptReceivedRequest(String groupId) async {
    try {
      emit(const GroupActionLoading());

      final isSuccess = await _groupUseCase.acceptReceivedGroup(groupId);
      if (isSuccess) {
        emit(const GroupActionSuccess());
      } else {
        emit(const GroupActionFailure(
            message: 'Something went wrong, please try again'));
      }
    } catch (e) {
      emit(GroupActionFailure(message: e.toString()));
    }
  }
}
