import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:videocall/common/widgets/stateless/buttons/float_action_button_video.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart';

class PersonalCallActions extends StatelessWidget {
  const PersonalCallActions(
      {Key? key, required this.localRender, required this.remoteRender})
      : super(key: key);

  final RTCVideoRenderer localRender;
  final RTCVideoRenderer remoteRender;

  void _handleOnVideoCameraBtn(BuildContext ctx) {
    _closeMedia(
      "video",
      (bool isTrackEnabled) {
        //setState(() => {isCameraOpen = isTrackEnabled});
      },
    )();
  }

  void _handleOnFlipCameraBtn(BuildContext ctx) {
    final track = localRender.srcObject?.getVideoTracks().first;
    if (track != null) {
      Helper.switchCamera(track);
      // setState(() {
      //   isCameraSwitched != isCameraSwitched;
      // });
    }
  }

  void _handleOnCallEndBtn(BuildContext ctx) async {
    await ctx.read<PersonalCallCubit>().hangUp(local: localRender);
    NavigationUtil.pop();
  }

  void _handleOnVolumeBtn(BuildContext ctx) {
    final track = remoteRender.srcObject?.getAudioTracks().first;
    if (track != null) {
      track.enabled = !track.enabled;
      log("Enable camera ${track.enabled}");
      // setState(() {
      //   isVolumeUp = track.enabled;
      // });
    }
  }

  Widget _buildRowBtnActions(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatActionButtonVideo(
          icon: Icons.videocam_outlined,
          onPress: () => _handleOnVideoCameraBtn(ctx),
        ),
        FloatActionButtonVideo(
          icon: Icons.flip_camera_ios_outlined,
          onPress: () => _handleOnFlipCameraBtn(ctx),
        ),
        FloatActionButtonVideo(
          icon: Icons.call_end,
          onPress: () => _handleOnCallEndBtn(ctx),
        ),
        FloatActionButtonVideo(
          icon: Icons.volume_up,
          onPress: () => _handleOnVolumeBtn(ctx),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
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
    );
  }

  Function _closeMedia(String kind, Function(bool) setStateTrack) {
    return () async {
      final track = localRender.srcObject
          ?.getTracks()
          .firstWhereOrNull((track) => track.kind == kind);
      if (track != null) {
        track.enabled = !track.enabled;
        log("Enable camera ${track.enabled}");
        setStateTrack(track.enabled);
      }
    };
  }
}
