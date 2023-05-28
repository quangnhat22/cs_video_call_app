import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:videocall/presentation/call/call_demo/cubit_call/call_cubit.dart';

class VideosContainer extends StatelessWidget {
  const VideosContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallCubit, CallState>(builder: (context, state) {
      return Stack(
        children: <Widget>[
          RTCVideoView(
            state.remoteRenderer!,
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
                state.localRenderer!,
                mirror: true,
                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              ),
            ),
          ),
        ],
      );
    });
  }
}
