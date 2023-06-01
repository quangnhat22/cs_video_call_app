import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart';
import 'package:videocall/presentation/call/personal_call/widgets/personal_accepted.dart';
import 'package:videocall/presentation/call/personal_call/widgets/personal_call_actions.dart';
import 'package:videocall/presentation/call/personal_call/widgets/personal_call_preparing.dart';

class PersonalCallMainBody extends StatefulWidget {
  const PersonalCallMainBody({Key? key}) : super(key: key);

  @override
  State<PersonalCallMainBody> createState() => _PersonalCallMainBodyState();
}

class _PersonalCallMainBodyState extends State<PersonalCallMainBody> {
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();

  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  void _initializeWebRTC() async {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    if (context.mounted) {
      context.read<PersonalCallCubit>().openUserMedia(
            local: _localRenderer,
            remote: _remoteRenderer,
          );

      context.read<PersonalCallCubit>().addRemoteMediaStream.listen((stream) {
        _remoteRenderer.srcObject = stream;
        setState(() {});
      });

      context.read<PersonalCallCubit>().localTrackStream.listen((event) {
        setState(() {});
      });

      context.read<PersonalCallCubit>().remoteTrackStream.listen((event) {
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    _initializeWebRTC();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocConsumer<PersonalCallCubit, PersonalCallState>(
          listener: (context, state) {
            if (state.status == CallStateStatus.start) {
              context.read<PersonalCallCubit>().setUpRoom();
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case CallStateStatus.initial:
                {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              case CallStateStatus.preparing:
              case CallStateStatus.start:
              case CallStateStatus.calling:
                {
                  return PersonalCallPreparing(
                    localRenderer: _localRenderer,
                  );
                }

              case CallStateStatus.accepted:
                {
                  return PersonalAccepted(
                    localRenderer: _localRenderer,
                    remoteRenderer: _remoteRenderer,
                  );
                }
              default:
                {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
            }
          },
        ),
        PersonalCallActions(
          localRender: _localRenderer,
          remoteRender: _remoteRenderer,
        ),
      ],
    );
  }

  @override
  void dispose() {
    //context.read<PersonalCallCubit>().hangUp(local: _localRenderer);
    _localRenderer.dispose();
    _remoteRenderer.dispose();

    super.dispose();
  }
}
