import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/cubit_group_meeting/group_meeting_cubit.dart';

import '../widgets/group_meeting_list.dart';

class GroupMeetingPage extends StatelessWidget {
  const GroupMeetingPage({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<GroupMeetingCubit>()..getListGroupMeeting(groupId: groupId),
      child: GroupsCallView(
        groupId: groupId,
      ),
    );
  }
}

class GroupsCallView extends StatelessWidget {
  const GroupsCallView({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return const GroupMeetingList();
  }
}
