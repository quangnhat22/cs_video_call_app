part of groups_details;

class GroupsCallsTabs extends StatelessWidget {
  GroupsCallsTabs({super.key});

  final List<Map<String, dynamic>> groupCalls = [
    {
      'groupName': 'Gặp nhau cuối tuần',
      'startedAt':
          '${DateFormat.Hm().format(DateTime.now())} ${DateFormat.yMMMMd().format(DateTime.now())}',
      'duration': '00:14:50',
      'isCalling': false,
      'participants': [
        {'name': 'Trần Đình Khôi'}
      ]
    }
  ];

  final settings = RestrictedAmountPositions(
      maxAmountItems: 10,
      maxCoverage: 0.3,
      minCoverage: 0.2,
      align: StackAlign.left);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                NavigationUtil.pushNamed(routeName: RouteName.teamCallDetails);
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(groupCalls[index]['groupName']),
                    subtitle:
                        Text('Started at ${groupCalls[index]['startedAt']}'),
                    leading: const CircleAvatar(
                      child: Icon(Icons.videocam_outlined),
                    ),
                    trailing: groupCalls[index]['isCalling']
                        ? TextButton(
                            onPressed: () {}, child: const Text('Join'))
                        : Text(groupCalls[index]['duration']),
                  ),
                  if (!groupCalls[index]['isCalling'])
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12, bottom: 12, left: 12),
                      child: AvatarStack(
                        settings: settings,
                        height: 40,
                        avatars: [
                          for (var n = 0; n < 50; n++)
                            NetworkImage('https://i.pravatar.cc/150?img=$n'),
                        ],
                      ),
                    )
                ],
              ),
            ),
          );
        },
        itemCount: groupCalls.length,
      ),
    );
  }
}
