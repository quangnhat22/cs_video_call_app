import 'package:flutter/material.dart';
import 'package:videocall/presentation/groups/groups_details/group_meeting/widgets/list_group_meeting.dart';

class GroupMeetingPage extends StatelessWidget {
  const GroupMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GroupsCallView();
  }
}

class GroupsCallView extends StatelessWidget {
  const GroupsCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const ListGroupMeeting(groupId: "1");
        },
        itemCount: 10,
      ),
    );
  }
}
