import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/cubit_group_meeting/group_meeting_cubit.dart';

import '../widgets/group_meeting_list.dart';

class GroupMeetingPage extends StatefulWidget {
  const GroupMeetingPage(
      {super.key, required this.groupId, required this.groupName});

  final String groupId;
  final String groupName;

  @override
  State<GroupMeetingPage> createState() => _GroupMeetingPageState();
}

class _GroupMeetingPageState extends State<GroupMeetingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => getIt<GroupMeetingCubit>()
        ..getListGroupMeeting(groupId: widget.groupId),
      child: GroupsCallView(
        groupName: widget.groupName,
      ),
    );
  }
}

class GroupsCallView extends StatelessWidget {
  const GroupsCallView({super.key, required this.groupName});

  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GroupMeetingList(
        groupName: groupName,
      ),
    );
  }
}
