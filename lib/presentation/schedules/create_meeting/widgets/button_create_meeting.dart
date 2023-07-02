import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_meeting_bloc.dart';
import '../cubit/create_schedule_form_cubit.dart';

class ButtonCreateMeeting extends StatelessWidget {
  const ButtonCreateMeeting({super.key});

  void _submitCreateMeeting(BuildContext ctx) {
    final createMeetingFormState = ctx.read<CreateScheduleFormCubit>().state;
    final meetingTitle = createMeetingFormState.meetingTitle;
    final meetingDescription = createMeetingFormState.description;
    if (meetingTitle == null || meetingTitle.trim().isEmpty) {
      return;
    }
    ctx.read<CreateMeetingBloc>().add(CreateMeetingSubmitted(
        meetingTitle: meetingTitle, description: meetingDescription));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMeetingBloc, CreateMeetingState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          inProgress: () {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: CircularProgressIndicator(strokeWidth: 3),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () => _submitCreateMeeting(context),
              icon: const Icon(Icons.done),
            );
          },
        );
      },
    );
  }
}
