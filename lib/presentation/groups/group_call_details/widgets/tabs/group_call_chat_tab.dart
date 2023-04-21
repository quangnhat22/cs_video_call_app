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
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              groupChat[index]['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(groupChat[index]['chatText']),
            leading: const CircleAvatar(
              child: Text('A'),
            ),
            // isThreeLine: true,
            trailing: Text(DateFormat.Hm().format(DateTime.now())),
          );
        },
        itemCount: groupChat.length,
      ),
    );
  }
}
