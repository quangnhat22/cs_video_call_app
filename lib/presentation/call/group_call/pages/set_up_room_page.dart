import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/common/widgets/stateless/form/text_form_field.dart';
import 'package:videocall/core/routes/app_navigation.dart';
import 'package:videocall/core/routes/route_name.dart';
import 'package:videocall/core/utils/check_permission.dart';

class SetUpRoomPage extends StatefulWidget {
  const SetUpRoomPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  State<SetUpRoomPage> createState() => _SetUpRoomPageState();
}

class _SetUpRoomPageState extends State<SetUpRoomPage> {
  final _uriCtrl = TextEditingController();
  final _tokenCtrl = TextEditingController();
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    if (lkPlatformIs(PlatformType.android)) {
      AppCheckPermission.checkPermissions();
    }
  }

  @override
  void dispose() {
    _uriCtrl.dispose();
    _tokenCtrl.dispose();
    super.dispose();
  }

  void _connectRoom() async {
    try {
      setState(() {
        _busy = true;
      });
      await widget.room.connect(
        "ws://192.168.1.2:7880",
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
      final listener = widget.room.createListener();
      NavigationUtil.pushNamed(routeName: RouteName.groupCall, args: {
        "room": widget.room,
        "listen": listener,
      });
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CTextFormField(
                    label: 'Server URL',
                    controller: _uriCtrl,
                    icon: const Icon(Icons.link),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CTextFormField(
                    label: 'Token',
                    controller: _tokenCtrl,
                    icon: const Icon(Icons.link),
                  ),
                ),
                ElevatedButton(
                  onPressed: _busy ? null : () => _connectRoom(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_busy)
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      const Text('CONNECT'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
