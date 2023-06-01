import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:videocall/common/widgets/stateless/custom_elevated_button.dart';
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart';

class PersonalCallPreparing extends StatelessWidget {
  const PersonalCallPreparing({
    Key? key,
    required this.localRenderer,
  }) : super(key: key);

  final RTCVideoRenderer localRenderer;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: RTCVideoView(
                localRenderer,
                mirror: true,
                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        BlocBuilder<PersonalCallCubit, PersonalCallState>(
            builder: (context, state) {
          if (state.status == CallStateStatus.calling) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            );
          } else {
            return CustomElevatedButton(
              buttonText: "Start call",
              onPressed: () {
                context.read<PersonalCallCubit>().onCallStart();
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              width: 0.6.sw,
            );
          }
        }),
      ],
    );
  }
}
