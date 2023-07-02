import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/call/livekit_call_usecase.dart';

import '../../../../../domain/entities/group_meeting_entity.dart';

part 'group_list_meeting_event.dart';
part 'group_list_meeting_state.dart';
part 'group_list_meeting_bloc.freezed.dart';

@Injectable()
class GroupListMeetingBloc
    extends Bloc<GroupListMeetingEvent, GroupListMeetingState> {
  GroupListMeetingBloc({required LiveKitCallUseCase liveKitCallUseCase})
      : _groupMeetingUC = liveKitCallUseCase,
        super(const _Initial()) {
    on<GroupListMeetingEvent>((event, emit) async {
      await event.map(started: (event) async => _pageStarted(event, emit));
    });
  }

  final LiveKitCallUseCase _groupMeetingUC;

  Future<void> _pageStarted(
      _Started event, Emitter<GroupListMeetingState> emit) async {
    try {
      emit(const GroupListMeetingInProgress());
      final listGroupMeeting =
          await _groupMeetingUC.getListMeeting(event.groupId);
      emit(GroupListMeetingSuccess(listMeeting: listGroupMeeting));
    } catch (e) {
      emit(GroupListMeetingFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
