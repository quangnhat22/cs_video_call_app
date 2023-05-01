part of group_call_details;

class GroupCallChatList extends StatelessWidget {
  final List<Map<String, dynamic>> chatList;

  const GroupCallChatList(this.chatList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            chatList[index]['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(chatList[index]['chatText']),
          leading: const CircleAvatar(
            child: Text('A'),
          ),
          // isThreeLine: true,
          trailing: Text(DateFormat.Hm().format(DateTime.now())),
        );
      },
      itemCount: chatList.length,
    );
  }
}
