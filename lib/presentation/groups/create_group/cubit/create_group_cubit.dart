import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'create_group_state.dart';
part 'create_group_cubit.freezed.dart';

@Injectable()
class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit({required GroupUseCase groupUseCase})
      : _groupUseCase = groupUseCase,
        super(const _Initial());

  final GroupUseCase _groupUseCase;

  Future<void> sendCreateGroupRequest() async {
    try {
      final createGroupState = state as _Initial;
      if (!createGroupState.isValid) return;

      await _groupUseCase.createGroup(createGroupState.groupName,
          createGroupState.groupImage, createGroupState.members);
      emit(const CreateGroupState.sendCreateRequestSuccess());
    } catch (e) {
      emit(SentCreateRequestGroupFailure(message: e.toString()));
    } finally {
      emit(const _Initial());
    }
  }

  void groupImageChanged(String groupImage) {
    final createGroupState = state as _Initial;
    emit(createGroupState.copyWith(
        groupImage: groupImage,
        isValid:
            groupImage.isNotEmpty && createGroupState.groupName.isNotEmpty));
  }

  void groupNameChanged(String groupName) {
    final createGroupState = state as _Initial;
    emit(createGroupState.copyWith(
        groupName: groupName,
        isValid:
            createGroupState.groupImage.isNotEmpty && groupName.isNotEmpty));
  }

  void groupMembersChanged(UserEntity member) {
    final createGroupState = state as _Initial;
    final existingMember = createGroupState.members.firstWhere(
      (item) => item?.id == member.id,
      orElse: () => null,
    );

    final updatedMembers = [...createGroupState.members];

    if (existingMember == null) {
      updatedMembers.add(member);
    } else {
      updatedMembers.removeWhere((element) => element?.id == member.id);
    }

    emit(createGroupState.copyWith(members: updatedMembers));
  }
}
