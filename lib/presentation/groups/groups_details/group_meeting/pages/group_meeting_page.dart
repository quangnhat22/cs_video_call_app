import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/bloc/group_list_meeting_bloc.dart';

import '../widgets/group_meeting_list.dart';

class GroupMeetingPage extends StatelessWidget {
  const GroupMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GroupListMeetingBloc>(),
      child: const GroupsCallView(),
    );
  }
}

class GroupsCallView extends StatelessWidget {
  const GroupsCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GroupMeetingList();
  }
}
