part of group_call_details;

class GroupCallChatTab extends StatelessWidget {
  GroupCallChatTab({super.key});

  final List<Map<String, dynamic>> groupChat = [
    {
      'name': 'Nguyễn Văn An',
      'chatText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing adipiscing elit',
    },
    {
      'name': 'Nguyễn Văn Bình',
      'chatText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing adipiscing elit',
    },
    {
      'name': 'Nguyễn Tự Cường',
      'chatText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing adipiscing elit',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GroupCallChatList(groupChat),
    );
  }
}
