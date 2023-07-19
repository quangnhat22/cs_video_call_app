import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/cubit_group_meeting/group_meeting_cubit.dart';

import '../widgets/group_meeting_list.dart';

class GroupMeetingPage extends StatefulWidget {
  const GroupMeetingPage({super.key, required this.groupId});

  final String groupId;

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
        groupId: widget.groupId,
      ),
    );
  }
}

class GroupsCallView extends StatelessWidget {
  const GroupsCallView({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: GroupMeetingList(),
    );
  }
}
