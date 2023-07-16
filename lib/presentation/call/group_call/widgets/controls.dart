import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:videocall/core/utils/live_kit_until.dart';

import 'icon_wrapper.dart';

class Controls extends StatefulWidget {
  const Controls({
    Key? key,
    required this.room,
    required this.participant,
    required this.pageController,
  }) : super(key: key);
  final Room room;
  final LocalParticipant participant;
  final PageController pageController;

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  CameraPosition position = CameraPosition.front;

  List<MediaDevice>? _audioInputs;
  List<MediaDevice>? _audioOutputs;
  List<MediaDevice>? _videoInputs;

  StreamSubscription? _subscription;

  LocalParticipant get participant => widget.participant;

  bool get isMuted => participant.isMuted;

  @override
  void initState() {
    super.initState();
    participant.addListener(_onChange);
    _subscription = Hardware.instance.onDeviceChange.stream
        .listen((List<MediaDevice> devices) {
      _loadDevices(devices);
    });
    Hardware.instance.enumerateDevices().then(_loadDevices);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _onChange() {
    //trigger refresh
    setState(() {});
  }

  void _loadDevices(List<MediaDevice> devices) {
    _audioInputs = devices.where((d) => d.kind == "audioinput").toList();
    _audioOutputs = devices.where((d) => d.kind == "audioutput").toList();
    _videoInputs = devices.where((d) => d.kind == "videoinput").toList();
    _onChange();
  }

  void _unPublishAll() async {
    final result = await context.showUnPublishDialog();
    if (result == true) await participant.unpublishAllTracks();
  }

  void _selectAudioInput(MediaDevice device) async {
    await widget.room.setAudioInputDevice(device);
    _onChange();
  }

  void _selectAudioOutput(MediaDevice device) async {
    await widget.room.setAudioOutputDevice(device);
    _onChange();
  }

  void _selectVideoInput(MediaDevice device) async {
    await widget.room.setVideoInputDevice(device);
    _onChange();
  }

  void _toggleCamera() async {
    //
    final track = participant.videoTracks.firstOrNull?.track;
    if (track == null) return;

    try {
      final newPosition = position.switched();
      await track.setCameraPosition(newPosition);
      setState(() {
        position = newPosition;
      });
    } catch (error) {
      log('could not restart track: $error');
      return;
    }
  }

  Future<void> _enableAudio() async {
    await participant.setMicrophoneEnabled(true);
  }

  void _disableAudio() async {
    await participant.setMicrophoneEnabled(false);
  }

  void _enableVideo() async {
    await participant.setCameraEnabled(true);
  }

  void _disableVideo() async {
    await participant.setCameraEnabled(false);
  }

  void _enableScreenShare() async {
    if (WebRTC.platformIsDesktop) {
      try {
        final source = await showDialog<DesktopCapturerSource>(
          context: context,
          builder: (context) => ScreenSelectDialog(),
        );
        if (source == null) {
          log('cancelled screenshare');
          return;
        }
        log('DesktopCapturerSource: ${source.id}');
        var track = await LocalVideoTrack.createScreenShareTrack(
          ScreenShareCaptureOptions(
            sourceId: source.id,
            maxFrameRate: 15.0,
          ),
        );
        await participant.publishVideoTrack(track);
      } catch (e) {
        log('could not publish video: $e');
      }
      return;
    }
    if (WebRTC.platformIsAndroid) {
      // Android specific
      requestBackgroundPermission([bool isRetry = false]) async {
        // Required for android screenshare.
        try {
          bool hasPermissions = await FlutterBackground.hasPermissions;
          if (!isRetry) {
            const androidConfig = FlutterBackgroundAndroidConfig(
              notificationTitle: 'Screen Sharing',
              notificationText: 'LiveKit Example is sharing the screen.',
              notificationImportance: AndroidNotificationImportance.Default,
              notificationIcon: AndroidResource(
                name: 'ic_launcher',
                defType: 'mipmap',
              ),
            );
            hasPermissions = await FlutterBackground.initialize(
                androidConfig: androidConfig);
          }
          if (hasPermissions &&
              !FlutterBackground.isBackgroundExecutionEnabled) {
            await FlutterBackground.enableBackgroundExecution();
          }
        } catch (e) {
          if (!isRetry) {
            return await Future<void>.delayed(const Duration(seconds: 1),
                () => requestBackgroundPermission(true));
          }
          log('could not publish video: $e');
        }
      }

      await requestBackgroundPermission();
    }
    if (WebRTC.platformIsIOS) {
      var track = await LocalVideoTrack.createScreenShareTrack(
        const ScreenShareCaptureOptions(
          useiOSBroadcastExtension: true,
          maxFrameRate: 15.0,
        ),
      );
      await participant.publishVideoTrack(track);
      return;
    }
    await participant.setScreenShareEnabled(true, captureScreenAudio: true);
  }

  void _disableScreenShare() async {
    await participant.setScreenShareEnabled(false);
    if (Platform.isAndroid) {
      // Android specific
      try {
        //   await FlutterBackground.disableBackgroundExecution();
      } catch (error) {
        log('error disabling screen share: $error');
      }
    }
  }

  void _onTapDisconnect() async {
    final result = await context.showDisconnectDialog();
    if (result == true) await widget.room.disconnect();
  }

  void _onTapUpdateSubscribePermission() async {
    final result = await context.showSubscribePermissionDialog();
    if (result != null) {
      try {
        widget.room.localParticipant?.setTrackSubscriptionPermissions(
          allParticipantsAllowed: result,
        );
      } catch (error) {
        await context.showErrorDialog(error);
      }
    }
  }

  Widget _buildIconWhenMicrophoneIsEnabled() {
    if (participant.isMicrophoneEnabled()) {
      return PopupMenuButton<MediaDevice>(
        icon: const IconWrapper(
          iconButton: Icon(
            Icons.settings_voice,
            color: Colors.black,
          ),
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<MediaDevice>(
              value: null,
              onTap: isMuted ? _enableAudio : _disableAudio,
              child: const ListTile(
                leading: Icon(Icons.mic_off_outlined, color: Colors.white),
                title: Text('Mute Microphone'),
              ),
            ),
            if (_audioInputs != null)
              ..._audioInputs!.map((device) {
                return PopupMenuItem<MediaDevice>(
                  value: device,
                  child: ListTile(
                    leading: (device.deviceId ==
                            widget.room.selectedAudioInputDeviceId)
                        ? const Icon(
                            Icons.check_box_outlined,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.square_outlined,
                            color: Colors.white,
                          ),
                    title: Text(device.label),
                  ),
                  onTap: () => _selectAudioInput(device),
                );
              }).toList()
          ];
        },
      );
    }

    return IconWrapper(
      iconButton: IconButton(
        onPressed: _enableAudio,
        icon: const Icon(
          Icons.mic_off_outlined,
          color: Colors.black,
        ),
        tooltip: 'un-mute audio',
      ),
    );
  }

  Widget _buildVolumnIcon() {
    return PopupMenuButton<MediaDevice>(
      icon: const IconWrapper(
        iconButton: Icon(
          Icons.volume_up,
          color: Colors.black,
        ),
      ),
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<MediaDevice>(
            value: null,
            child: ListTile(
              leading: Icon(
                Icons.speaker,
                color: Colors.white,
              ),
              title: Text('Select Audio Output'),
            ),
          ),
          if (_audioOutputs != null)
            ..._audioOutputs!.map((device) {
              return PopupMenuItem<MediaDevice>(
                value: device,
                child: ListTile(
                  leading: (device.deviceId ==
                          widget.room.selectedAudioOutputDeviceId)
                      ? const Icon(
                          Icons.check_box_outlined,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.square_outlined,
                          color: Colors.white,
                        ),
                  title: Text(device.label),
                ),
                onTap: () => _selectAudioOutput(device),
              );
            }).toList()
        ];
      },
    );
  }

  Widget _buildIconWhenCameraIsEnabled() {
    if (participant.isCameraEnabled()) {
      return PopupMenuButton<MediaDevice>(
        icon: const IconWrapper(
          iconButton: Icon(
            Icons.videocam,
            color: Colors.black,
          ),
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<MediaDevice>(
              value: null,
              onTap: _disableVideo,
              child: const ListTile(
                leading: Icon(
                  Icons.videocam_off,
                  color: Colors.white,
                ),
                title: Text('Disable Camera'),
              ),
            ),
            if (_videoInputs != null)
              ..._videoInputs!.map((device) {
                return PopupMenuItem<MediaDevice>(
                  value: device,
                  child: ListTile(
                    leading: (device.deviceId ==
                            widget.room.selectedVideoInputDeviceId)
                        ? const Icon(
                            Icons.check_box_outlined,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.square_outlined,
                            color: Colors.white,
                          ),
                    title: Text(device.label),
                  ),
                  onTap: () => _selectVideoInput(device),
                );
              }).toList()
          ];
        },
      );
    }

    return IconWrapper(
      iconButton: IconButton(
        onPressed: _enableVideo,
        icon: const Icon(
          Icons.videocam_off,
          color: Colors.black,
        ),
        tooltip: 'un-mute video',
      ),
    );
  }

  Widget _buildShareScreenIcon() {
    if (participant.isScreenShareEnabled()) {
      return IconWrapper(
        iconButton: IconButton(
          icon: const Icon(
            Icons.mobile_screen_share,
            color: Colors.black,
          ),
          onPressed: () => _disableScreenShare(),
          tooltip: 'unshare screen (experimental)',
        ),
      );
    }

    return IconWrapper(
      iconButton: IconButton(
        icon: const Icon(
          Icons.mobile_screen_share_outlined,
          color: Colors.black,
        ),
        onPressed: () => _enableScreenShare(),
        tooltip: 'share screen (experimental)',
      ),
    );
  }

  Widget _buildPanelSliding() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconWhenMicrophoneIsEnabled(),
        _buildVolumnIcon(),
        _buildIconWhenCameraIsEnabled(),
        const SizedBox(
          width: 10,
        ),
        IconWrapper(
          iconButton: IconButton(
            icon: const Icon(
              Icons.switch_camera_outlined,
              color: Colors.black,
            ),
            onPressed: _toggleCamera,
            tooltip: 'toggle camera',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        _buildShareScreenIcon(),
        const SizedBox(
          width: 10,
        ),
        // IconWrapper(
        //   iconButton: IconButton(
        //     onPressed: _unPublishAll,
        //     icon: const Icon(
        //       Icons.block,
        //       color: Colors.black,
        //     ),
        //     tooltip: 'UnPublish all',
        //   ),
        // ),
      ],
    );
  }

  Widget _buildCollapsedSliding() {
    return Wrap(
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 20,
      children: [
        IconWrapper(
          iconButton: IconButton(
            onPressed: _onTapDisconnect,
            icon: const Icon(
              Icons.call_end,
              color: Colors.white,
            ),
            tooltip: 'disconnect',
          ),
          backgroundColor: Colors.red,
        ),
        IconWrapper(
          iconButton: IconButton(
            onPressed: () {
              widget.pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            icon: const Icon(
              Icons.message_outlined,
            ),
            tooltip: 'message',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 80.h,
      maxHeight: 200.h,
      renderPanelSheet: false,
      panel: _buildPanelSliding(),
      collapsed: _buildCollapsedSliding(),
    );
  }
}
