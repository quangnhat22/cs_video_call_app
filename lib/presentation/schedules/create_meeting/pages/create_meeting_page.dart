import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/schedules/create_meeting/widgets/button_create_meeting.dart';

import '../bloc/create_meeting_bloc.dart';
import '../cubit/create_schedule_form_cubit.dart';
import '../widgets/create_meeting_form.dart';

class CreateMeetingPage extends StatelessWidget {
  const CreateMeetingPage({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CreateMeetingBloc>()
            ..add(CreateMeetingEvent.started(groupId: groupId)),
        ),
        BlocProvider(
          create: (_) => getIt<CreateScheduleFormCubit>(),
        ),
      ],
      child: const CreateMeetingView(),
    );
  }
}

class CreateMeetingView extends StatelessWidget {
  const CreateMeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateMeetingBloc, CreateMeetingState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          inSuccess: (token) {
            Navigator.of(context).pop(token);
          },
        );
      },
      child: const Scaffold(
        appBar: MPageAppBar(
          title: 'Create meeting',
          actionWidgets: [
            ButtonCreateMeeting(),
          ],
        ),
        body: CreateMeetingForm(),
      ),
    );
  }
}
