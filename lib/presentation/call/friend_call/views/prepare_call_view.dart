part of friend_call;

class FriendPrepareCallView extends StatefulWidget {
  const FriendPrepareCallView({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<FriendPrepareCallView> createState() => _FriendPrepareCallViewState();
}

class _FriendPrepareCallViewState extends State<FriendPrepareCallView> {
  LocalVideoTrack? videoTrack;

  bool isCameraOn = true;
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
    if (isCameraOn) {
      videoTrack?.mediaStreamTrack.stop();
    } else {
      videoTrack =
          await LocalVideoTrack.createCameraTrack(const CameraCaptureOptions(
        cameraPosition: CameraPosition.front,
        params: VideoParametersPresets.h720_169,
      ));
    }

    setState(() {
      isCameraOn = !isCameraOn;
    });

    if (context.mounted) {
      ctx.read<FriendCallCubit>().changedCameraPreviewStatus(isCameraOn);
    }
  }

  void _handleOnVolumeBtn(BuildContext ctx) {
    setState(() {
      isMicOn = !isMicOn;
    });
    ctx.read<FriendCallCubit>().changedAudioPreviewStatus(isMicOn);
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
                      child: isCameraOn
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
                    context.read<FriendCallCubit>().connectRoom();
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
