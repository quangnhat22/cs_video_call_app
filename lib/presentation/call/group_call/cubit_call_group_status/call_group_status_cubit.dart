import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/core/config/app_config.dart';
import 'package:videocall/data/models/message_call_model.dart';
import 'package:videocall/domain/entities/message_call_entity.dart';
import 'package:videocall/domain/entities/user_entity.dart';
import 'package:videocall/domain/modules/user/user_usecase.dart';

part 'call_group_status_cubit.freezed.dart';
part 'call_group_status_state.dart';

@Injectable()
class CallGroupStatusCubit extends Cubit<CallGroupStatusState> {
  final UserUseCase _userUseCase;

  CallGroupStatusCubit(this._userUseCase)
      : super(const CallGroupStatusState.initial());
  late final Room _room;

  late String _token;
  late String _groupId;

  late final EventsListener<RoomEvent> _listenNewMessage;

  final isOwnerRoom = false;

  //for room
  bool _isOpenCamera = true;
  bool _isSwitchCameraFront = true;
  bool _isOpenMic = false;

  void pageInited(String token, String groupId) {
    _token = token;
    _groupId = groupId;
  }

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

  Future<void> connectRoom() async {
    await _room.connect(
      "ws://${AppConfig.httpUrl}:7880",
      _token,
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

    _room.localParticipant?.setCameraEnabled(_isOpenCamera);
    // Turns microphone track on
    _room.localParticipant?.setMicrophoneEnabled(_isOpenMic);

    _listenNewMessage = _room.createListener()
      ..on<DataReceivedEvent>((event) async {
        receiveNewMessage(event);
      });

    //get user info from local for sending message with userInfo in the future
    final userInfo = await _userUseCase.getSelfFromLocal();
    emit(CallGroupConnectedSuccess(room: _room, user: userInfo));
  }

  Future<void> sendMessageData(String message) async {
    if (state is CallGroupConnectedSuccess) {
      final userInfo = (state as CallGroupConnectedSuccess).user;
      final listMessage =
          (state as CallGroupConnectedSuccess).listMessage ?? [];

      if (_room.localParticipant != null) {
        final newMessageModel = MessageCallModel(
          groupId: _groupId,
          senderId: userInfo?.id,
          name: userInfo?.name,
          avatar: userInfo?.avatar,
          message: message,
          senderTime: DateTime.now(),
        );
        final messageJson = jsonEncode(newMessageModel);
        final dataUtf8 = utf8.encode(messageJson);

        final newMessageEntity =
            MessageCallEntity.convertToMessageEntity(model: newMessageModel);

        await _room.localParticipant!.publishData(dataUtf8, topic: 'hello');
        emit((state as CallGroupConnectedSuccess)
            .copyWith(listMessage: [...listMessage, newMessageEntity]));
      }
    }
  }

  Future<void> receiveNewMessage(DataReceivedEvent event) async {
    try {
      if (state is CallGroupConnectedSuccess) {
        final listMessage =
            (state as CallGroupConnectedSuccess).listMessage ?? [];

        final dataDecoded = utf8.decode(event.data);
        final messageJson = jsonDecode(dataDecoded);
        final newMessage = MessageCallModel.fromJson(messageJson);
        final newMessageEntity =
            MessageCallEntity.convertToMessageEntity(model: newMessage);

        final listMessageUpdated = [...listMessage, newMessageEntity];
        emit((state as CallGroupConnectedSuccess)
            .copyWith(listMessage: listMessageUpdated));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> close() async {
    await _listenNewMessage.dispose();
    await _room.dispose();
    return super.close();
  }
}
