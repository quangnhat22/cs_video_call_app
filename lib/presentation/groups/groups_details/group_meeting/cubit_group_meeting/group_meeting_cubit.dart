import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/domain/entities/group_meeting_entity.dart';
import 'package:videocall/domain/modules/call/livekit_call_usecase.dart';
import 'package:videocall/domain/modules/group/group_usecase.dart';

part 'group_meeting_cubit.freezed.dart';
part 'group_meeting_state.dart';

@Injectable()
class GroupMeetingCubit extends Cubit<GroupMeetingState> {
  GroupMeetingCubit(
      {required LiveKitCallUseCase liveKitCallUC,
      required GroupUseCase groupUseCase})
      : _liveKitUC = liveKitCallUC,
        _groupUseCase = groupUseCase,
        super(const GroupMeetingState.initial());

  final LiveKitCallUseCase _liveKitUC;
  final GroupUseCase _groupUseCase;
  String _groupId = "";

  Future<void> getListGroupMeeting({String? groupId}) async {
    try {
      groupId ??= _groupId;
      _groupId = groupId;
      emit(const GroupMeetingGetListInProgress());
      final listMeeting = await _liveKitUC.getListMeeting(_groupId);
      emit(GroupMeetingGetListSuccess(listMeeting: listMeeting));
    } catch (e) {
      emit(GroupMeetingGetListFail(message: e.toString()));
    }
  }

  Future<void> refreshGroupMeeting({String? groupId}) async {
    try {
      groupId ??= _groupId;
      _groupId = groupId;

      final listMeeting = await _liveKitUC.getListMeeting(_groupId);
      emit(GroupMeetingGetListSuccess(listMeeting: listMeeting));
    } catch (e) {
      emit(GroupMeetingGetListFail(message: e.toString()));
    }
  }

  Future<void> joinMeeting({required String meetingId}) async {
    try {
      final token =
          await _liveKitUC.joinMeeting(groupId: _groupId, meetingId: meetingId);
      if (token != null) {
        NavigationUtil.pushNamed(routeName: RouteName.createGroupCall, args: {
          "token": token,
          "groupId": _groupId,
        });
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getGroupTitle({required String groupId}) async {
    try {
      final group = await _groupUseCase.getGroupDetail(groupId);
      return group!.groupDetails!.name ?? '';
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
