import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/utils/snack_bar.dart';
import 'package:videocall/domain/modules/call/livekit_call_usecase.dart';

part 'create_meeting_event.dart';
part 'create_meeting_state.dart';
part 'create_meeting_bloc.freezed.dart';

@Injectable()
class CreateMeetingBloc extends Bloc<CreateMeetingEvent, CreateMeetingState> {
  final LiveKitCallUseCase _useCase;

  CreateMeetingBloc(this._useCase) : super(const _Initial()) {
    on<CreateMeetingEvent>((event, emit) async {
      await event.map(
        started: (event) async => await _started(event, emit),
        submit: (event) async => await _submit(event, emit),
      );
    });
  }

  late String _groupId;

  _started(_Started event, Emitter<CreateMeetingState> emit) {
    _groupId = event.groupId;
  }

  Future<void> _submit(
      CreateMeetingSubmitted event, Emitter<CreateMeetingState> emit) async {
    try {
      emit(const CreateMeetingInProgress());
      final token = await _useCase.createMeeting(
          groupId: _groupId,
          title: event.meetingTitle,
          description: event.description);
      if (token != null) {
        emit(CreateMeetingInSuccess(token: token));
        SnackBarApp.showSnackBar(
            null, "Create meeting success", TypesSnackBar.success);
      } else {
        emit(const CreateMeetingInFail());
        SnackBarApp.showSnackBar(
            null, "Create meeting fail", TypesSnackBar.error);
      }
    } catch (e) {
      emit(const CreateMeetingInFail());
      SnackBarApp.showSnackBar(
          null, "Create meeting fail", TypesSnackBar.error);
    }
    //return null;
  }
}
