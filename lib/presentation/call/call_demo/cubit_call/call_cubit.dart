import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/domain/modules/call/call_usecase.dart';

part 'call_cubit.freezed.dart';
part 'call_state.dart';

@Injectable()
class CallCubit extends Cubit<CallState> {
  CallCubit({required CallUseCase callUC})
      : _callUseCase = callUC,
        super(const CallState.initial());

  final CallUseCase _callUseCase;

  void pageStarted({
    CallStatus? callStatus,
    ReceivedAction? receivedAction,
    String? friendId,
  }) {
    final localRender = RTCVideoRenderer();
    final remoteRender = RTCVideoRenderer();
    localRender.initialize();
    remoteRender.initialize();

    //set up user media
    _callUseCase.openUserMedia(localRender, remoteRender);

    emit(state.copyWith(
      localRenderer: localRender,
      remoteRenderer: remoteRender,
      callStatus: callStatus ?? CallStatus.calling,
    ));

    if (friendId != null) {
      //_callUseCase.createRoom(state.remoteRenderer!, friendId);
    }

    if (receivedAction != null) {
      log(receivedAction.toString());
      final res = jsonDecode(receivedAction.payload?["notification"] as String);
    }

    // _callUseCase.setOnAddRemoteStream((stream) {
    //   print("here");
    //   state.remoteRenderer?.setSrcObject(stream: stream);
    //   emit(state.copyWith(
    //     remoteRenderer: state.remoteRenderer,
    //   ));
    // });
    //_callUseCase.on

    //emit(state.copyWith(callStatus: CallStatus.accepted));
  }

  @override
  Future<void> close() {
    _callUseCase.hangUp(state.localRenderer!);
    // state.localRenderer!.dispose();
    // state.remoteRenderer!.dispose();
    return super.close();
  }
}
