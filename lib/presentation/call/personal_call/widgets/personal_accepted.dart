import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class PersonalAccepted extends StatelessWidget {
  const PersonalAccepted(
      {Key? key, required this.localRenderer, required this.remoteRenderer,})
      : super(key: key);

  final RTCVideoRenderer remoteRenderer;
  final RTCVideoRenderer localRenderer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RTCVideoView(
          remoteRenderer,
          objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 120,
            height: 200,
            color: Colors.black,
            child: RTCVideoView(
              localRenderer,
              mirror: true,
              objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
            ),
          ),
        ),
      ],
    );
  }
}


