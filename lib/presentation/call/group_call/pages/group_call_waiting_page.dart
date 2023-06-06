import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:videocall/core/routes/app_navigation.dart';

import '../../../../common/widgets/stateless/buttons/custom_elevated_button.dart';
import '../../../../common/widgets/stateless/buttons/float_action_button_video.dart';
import '../cubit_call_group_status/call_group_status_cubit.dart';

class GroupCallPreparingPage extends StatefulWidget {
  const GroupCallPreparingPage({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<GroupCallPreparingPage> createState() => _GroupCallPreparingPageState();
}

class _GroupCallPreparingPageState extends State<GroupCallPreparingPage> {
  LocalVideoTrack? videoTrack;
  bool isCameraOn = true;
  bool isCameraFront = true;
  bool isMicOn = true;

  @override
  void initState() {
    super.initState();
    (() async {
      _createVideoLocalParticipant();
    })();
  }

  @override
  void dispose() {
    (() async {
      await _removeMediaStream();
    })();
    super.dispose();
  }

  Future<void> _createVideoLocalParticipant() async {
    try {
      await _createCameraTrack();
      setState(() {});
    } catch (e) {
      log('could not publish video: $e');
    }
  }

  Future<void> _createCameraTrack() async {
    videoTrack =
        await LocalVideoTrack.createCameraTrack(const CameraCaptureOptions(
      cameraPosition: CameraPosition.front,
      params: VideoParametersPresets.h720_169,
    ));
  }

  Future<void> _removeMediaStream() async {
    await videoTrack?.mediaStream.dispose();
    await videoTrack?.mute();
    await videoTrack?.dispose();
  }

  void _setVideoTrack(BuildContext ctx) async {
    videoTrack?.mediaStreamTrack.enabled = !isCameraOn;
    setState(() {
      isCameraOn = !isCameraOn;
    });

    if (context.mounted) {
      ctx.read<CallGroupStatusCubit>().changedCameraPreviewStatus(isCameraOn);
    }
  }

  void _switchCamera() async {
    if (videoTrack?.mediaStreamTrack == null) return;
    Helper.switchCamera(videoTrack!.mediaStreamTrack);
    setState(() {
      isCameraFront = !isCameraFront;
    });
  }

  void _handleOnVolumeBtn(BuildContext ctx) {
    setState(() {
      isMicOn = !isMicOn;
    });
    ctx.read<CallGroupStatusCubit>().changedAudioPreviewStatus(isMicOn);
  }

  void _handleOnCallEndBtn() async {
    await _removeMediaStream();
    NavigationUtil.pop();
  }

  Widget _buildRowBtnActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatActionButtonVideo(
          icon: isCameraOn
              ? Icons.videocam_outlined
              : Icons.videocam_off_outlined,
          onPress: () async => _setVideoTrack(context),
        ),
        // FloatActionButtonVideo(
        //   icon: isCameraFront
        //       ? Icons.flip_camera_ios_outlined
        //       : Icons.flip_camera_ios,
        //   onPress: () => _switchCamera(),
        // ),
        FloatActionButtonVideo(
          icon: Icons.call_end,
          onPress: () => _handleOnCallEndBtn(),
        ),
        FloatActionButtonVideo(
          icon: isMicOn ? Icons.volume_up_outlined : Icons.volume_off_outlined,
          onPress: () => _handleOnVolumeBtn(context),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (videoTrack == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 300.w,
                    height: 360.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: !videoTrack!.muted
                          ? VideoTrackRenderer(videoTrack as VideoTrack)
                          : Container(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                CustomElevatedButton(
                  buttonText: "Start call",
                  onPressed: () {
                    context.read<CallGroupStatusCubit>().connectRoom();
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  width: 0.6.sw,
                ),
              ],
            ),
            SlidingUpPanel(
              minHeight: 90.h,
              maxHeight: 200.h,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              panel: Container(
                color: Colors.black87,
                child: _buildRowBtnActions(context),
              ),
              collapsed: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: _buildRowBtnActions(context),
              ),
            ),
          ],
        ),
      );
    }
  }
}
