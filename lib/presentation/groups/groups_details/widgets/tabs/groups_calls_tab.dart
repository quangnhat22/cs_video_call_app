part of groups_details;

class GroupsCallsTabs extends StatelessWidget {
  const GroupsCallsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GroupMeetingList(),
    );
  }
}
