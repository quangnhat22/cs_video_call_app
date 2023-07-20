import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'edit_group_cubit.freezed.dart';
part 'edit_group_state.dart';

@Injectable()
class EditGroupCubit extends Cubit<EditGroupState> {
  EditGroupCubit({required GroupUseCase groupUseCase})
      : _groupUseCase = groupUseCase,
        super(const EditGroupState.initial());

  final GroupUseCase _groupUseCase;

  void initValue(String groupName, String? groupImage) {
    final editGroupState = state as SentEditRequestGroupInitValue;
    emit(editGroupState.copyWith(
        groupName: groupName, groupImage: groupImage ?? ''));
  }

  void groupImageChanged(String groupImage) {
    final editGroupState = state as SentEditRequestGroupInitValue;
    emit(editGroupState.copyWith(
      groupImage: groupImage,
      isValid: editGroupState.groupName.isNotEmpty || groupImage.isNotEmpty,
    ));
  }

  void groupNameChanged(String groupName) {
    final editGroupState = state as SentEditRequestGroupInitValue;
    emit(editGroupState.copyWith(
        groupName: groupName,
        isValid: groupName.isNotEmpty || editGroupState.groupImage.isNotEmpty));
  }

  Future<void> sendEditGroupRequest(String groupId) async {
     try {
      final editGroupState = state as SentEditRequestGroupInitValue;
      if (!editGroupState.isValid) return;
      if (editGroupState.groupName.trim().isEmpty) return;
      emit(const SentEditRequestGroupInProgress());
      await _groupUseCase.editGroup(
          editGroupState.groupName.trim(), editGroupState.groupImage, groupId);
      emit(SentEditRequestGroupSuccess(groupName: editGroupState.groupName));
    } catch (e) {
      emit(SentEditRequestGroupFailure(message: e.toString()));
    }
  }
}
