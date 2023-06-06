part of groups_details;

class GroupMembersTab extends StatelessWidget {
  const GroupMembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          GroupMemberNumber(),
          GroupMemberList(),
        ],
      ),
    );
  }
}
