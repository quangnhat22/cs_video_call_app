import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/friend/friend_usecase.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

import '../../../../domain/entities/user_entity.dart';

part 'new_member_state.dart';
part 'new_member_cubit.freezed.dart';

@Injectable()
class NewMemberCubit extends Cubit<NewMemberState> {
  NewMemberCubit(
      {required FriendUseCase friendUC, required GroupUseCase groupUC})
      : _friendUC = friendUC,
        _groupUC = groupUC,
        super(const NewMemberState.initial());

  final FriendUseCase _friendUC;
  final GroupUseCase _groupUC;

  Future<void> getListFriend() async {
    try {
      emit(const NewMemberGetListProgress());
      final listFriend = await _friendUC.getListFriend();
      emit(NewMemberState.getListFriendSuccess(listFriend: listFriend));
    } catch (e) {
      emit(const NewMemberState.getListFriendFail());
    }
  }

  Future<void> inviteNewMember(
      String groupId, List<String> newMemberIds) async {
    try {
      emit(const NewMemberInviteInProgress());
      final isInvitedSuccess =
          await _groupUC.inviteNewMember(groupId, newMemberIds);

      if (isInvitedSuccess) {
        emit(const NewMemberInviteInSuccess());
      }
    } catch (e) {
      emit(const NewMemberInviteFail());
    }
  }
}
