import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';

part 'call_group_status_cubit.freezed.dart';
part 'call_group_status_state.dart';

@Injectable()
class CallGroupStatusCubit extends Cubit<CallGroupStatusState> {
  CallGroupStatusCubit() : super(const CallGroupStatusState.initial());

  late final Room _room;

  Future<void> setUpRoom() async {
    try {
      emit(const CallGroupConnecting());
      _room = Room();
      final localVideo =
          await LocalVideoTrack.createCameraTrack(const CameraCaptureOptions(
        cameraPosition: CameraPosition.front,
        params: VideoParametersPresets.h720_169,
      ));

      await _room.localParticipant?.publishVideoTrack(localVideo);

      final localAudio = await LocalAudioTrack.create();
      await _room.localParticipant?.publishAudioTrack(localAudio);
      emit(CallGroupPreparing(room: _room));
    } catch (e) {
      emit(CallGroupConnectedFail(message: e.toString()));
      log(e.toString());
    }
  }

  void changedCameraPreviewStatus(bool value) async {
    _room.localParticipant?.setCameraEnabled(value);
  }

  void changedAudioPreviewStatus(bool value) async {
    _room.localParticipant?.setMicrophoneEnabled(value);
  }

  Future<void> connectRoom() async {
    await _room.connect(
      "ws://192.168.1.192:7880",
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODU4NjY1NjgsImlzcyI6ImRldmtleSIsIm5hbWUiOiJ1c2VyNyIsIm5iZiI6MTY4NTc4MDE2OCwic3ViIjoidXNlcjciLCJ2aWRlbyI6eyJyb29tIjoibXktZmlyc3Qtcm9vbSIsInJvb21Kb2luIjp0cnVlfX0.kPJmqbiLNFSJ0Eh_01jjxxyzLng1v9XLsf823B_VlVI",
      roomOptions: const RoomOptions(
        adaptiveStream: true,
        dynacast: true,
        defaultVideoPublishOptions: VideoPublishOptions(
          simulcast: true,
        ),
        defaultScreenShareCaptureOptions: ScreenShareCaptureOptions(
            useiOSBroadcastExtension: true,
            params: VideoParameters(
                dimensions: VideoDimensionsPresets.h1080_169,
                encoding: VideoEncoding(
                  maxBitrate: 3 * 1000 * 1000,
                  maxFramerate: 15,
                ))),
        defaultCameraCaptureOptions: CameraCaptureOptions(
          maxFrameRate: 30,
          params: VideoParameters(
            dimensions: VideoDimensionsPresets.h720_169,
            encoding: VideoEncoding(
              maxBitrate: 2 * 1000 * 1000,
              maxFramerate: 30,
            ),
          ),
        ),
      ),
    );
    _room.localParticipant?.setCameraEnabled(true);

// Turns microphone track on
    _room.localParticipant?.setMicrophoneEnabled(true);
    emit(CallGroupConnectedSuccess(room: _room));
  }

  @override
  Future<void> close() async {
    await _room.dispose();
    return super.close();
  }
}
