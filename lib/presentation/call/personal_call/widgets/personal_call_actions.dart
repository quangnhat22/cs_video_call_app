import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:videocall/common/widgets/stateless/buttons/float_action_button_video.dart';

class PersonalCallActions extends StatelessWidget {
  const PersonalCallActions({Key? key}) : super(key: key);

  void _handleOnVideoCameraBtn(BuildContext ctx) {}

  void _handleOnFlipCameraBtn(BuildContext ctx) {}

  void _handleOnCallEndBtn(BuildContext ctx) {}

  void _handleOnVolumeBtn(BuildContext ctx) {}

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
}
