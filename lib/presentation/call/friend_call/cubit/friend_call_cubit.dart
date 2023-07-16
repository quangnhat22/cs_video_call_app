import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/domain/modules/call/friend_call_use_case.dart';

import '../../../../core/config/app_config.dart';

part 'friend_call_cubit.freezed.dart';
part 'friend_call_state.dart';

@Injectable()
class FriendCallCubit extends Cubit<FriendCallState> {
  final FriendCallUseCase _friendCallUseCase;

  FriendCallCubit(this._friendCallUseCase)
      : super(const FriendCallState.initial());

  late final Room _room;
  late final String _callRoomId;

  //for room
  bool _isOpenCamera = true;
  bool _isSwitchCameraFront = true;
  bool _isOpenMic = true;

  void pageSenderInited({required String friendId}) async {
    try {
      emit(const FriendCallConnecting());
      final tokenLiveKit = await _friendCallUseCase.createFriendCall(friendId);
      if (tokenLiveKit != null &&
          tokenLiveKit.token != null &&
          tokenLiveKit.roomId != null) {
        _callRoomId = tokenLiveKit.roomId!;
        _room = Room();
        await _roomConnect(tokenLiveKit.token!);
        await _room.localParticipant?.setCameraEnabled(true);
        await _room.localParticipant?.setMicrophoneEnabled(true);
        emit(FriendCallConnectedSuccess(room: _room));
      } else {
        emit(const FriendCallConnectedFail());
      }
    } catch (e) {
      emit(FriendCallConnectedFail(message: e.toString()));
    }
  }

  void pageReceiverInited({required String chatRoomId}) async {
    try {
      final tokenLiveKit = await _friendCallUseCase.joinFriendCall(chatRoomId);
      if (tokenLiveKit != null) {
        await _setUpRoom(tokenLiveKit);
      } else {
        emit(const FriendCallConnectedFail());
      }
    } catch (e) {
      emit(FriendCallConnectedFail(message: e.toString()));
    }
  }

  Future<void> _setUpRoom(String token) async {
    try {
      _room = Room();
      final localVideo = await LocalVideoTrack.createCameraTrack(
          const CameraCaptureOptions(
              cameraPosition: CameraPosition.front,
              params: VideoParametersPresets.h720_169));

      await _room.localParticipant?.publishVideoTrack(localVideo);

      final localAudio = await LocalAudioTrack.create();
      await _room.localParticipant?.publishAudioTrack(localAudio);

      emit(FriendCallPreparing(room: _room, token: token));
    } catch (e) {
      emit(FriendCallConnectedFail(message: e.toString()));
    }
  }

  Future<void> connectRoom() async {
    try {
      if (state is FriendCallPreparing) {
        final token = (state as FriendCallPreparing).token;
        await _roomConnect(token);

        await _room.localParticipant?.setCameraEnabled(_isOpenCamera);
        await _room.localParticipant?.setMicrophoneEnabled(_isOpenMic);
        emit(FriendCallConnectedSuccess(room: _room));
      }
    } catch (e) {
      emit(const FriendCallConnectedFail());
    }
  }

  void memberCallChanged(int number) {
    if (state is FriendCallConnectedSuccess) {
      final isFullRoom = (state as FriendCallConnectedSuccess).isFullRoom;
      if (!isFullRoom) {
        emit((state as FriendCallConnectedSuccess)
            .copyWith(isFullRoom: number == 2));
      }
    }
  }

  void changedCameraPreviewStatus(bool value) async {
    _isOpenCamera = value;
    _room.localParticipant?.setCameraEnabled(value);
  }

  void changedCameraPosition(bool value) async {
    _isSwitchCameraFront = value;
  }

  void changedAudioPreviewStatus(bool value) async {
    _isOpenMic = value;
    _room.localParticipant?.setMicrophoneEnabled(value);
  }

  Future<void> abandonCall() async {
    try {
      if (state is FriendCallConnectedSuccess) {
        final isFullRoom = (state as FriendCallConnectedSuccess).isFullRoom;
        if (isFullRoom) return;
        final res = await _friendCallUseCase.abandonCall(_callRoomId);
        if (res) {
          emit(const FriendCallEnded());
        } else {
          emit(const FriendCallConnectedFail());
        }
      }
    } catch (e) {
      emit(const FriendCallConnectedFail());
    }
  }

  Future<void> _roomConnect(String token) async {
    await _room.connect(
      "ws://${AppConfig.httpUrl}:7880",
      token,
      roomOptions: RoomOptions(
        adaptiveStream: true,
        dynacast: true,
        defaultVideoPublishOptions: const VideoPublishOptions(
          simulcast: true,
        ),
        defaultScreenShareCaptureOptions: const ScreenShareCaptureOptions(
            useiOSBroadcastExtension: true,
            params: VideoParameters(
                dimensions: VideoDimensionsPresets.h1080_169,
                encoding: VideoEncoding(
                  maxBitrate: 3 * 1000 * 1000,
                  maxFramerate: 15,
                ))),
        defaultCameraCaptureOptions: CameraCaptureOptions(
          cameraPosition:
              _isSwitchCameraFront ? CameraPosition.front : CameraPosition.back,
          maxFrameRate: 30,
          params: const VideoParameters(
            dimensions: VideoDimensionsPresets.h720_169,
            encoding: VideoEncoding(
              maxBitrate: 2 * 1000 * 1000,
              maxFramerate: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _room.dispose();
    return super.close();
  }
}
