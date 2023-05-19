part of friends_infor;

class FriendsInforPage extends StatelessWidget {
  final bool isFriend = true;

  const FriendsInforPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> friendDetails = [
      {
        'title': AppLocalizations.of(context)!.friend_full_name,
        'leading': Icon(
          Icons.badge,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
      {
        'title': AppLocalizations.of(context)!.friend_phone,
        'leading': Icon(
          Icons.call,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
      {
        'title': AppLocalizations.of(context)!.friend_gender,
        'leading': Icon(
          Icons.people,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
      {
        'title': AppLocalizations.of(context)!.friend_birthday,
        'leading': Icon(
          Icons.today,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
    ];

    final List<Map<String, dynamic>> histories = [
      {
        'title':
            '${DateFormat.Hm().format(DateTime.now())} ${DateFormat.yMMMMd().format(DateTime.now())}',
        'type': 'incomming',
        'duration': '15s'
      },
      {
        'title':
            '${DateFormat.Hm().format(DateTime.now())} ${DateFormat.yMMMMd().format(DateTime.now())}',
        'type': 'outgoing',
        'duration': '1h 40m'
      },
      {
        'title':
            '${DateFormat.Hm().format(DateTime.now())} ${DateFormat.yMMMMd().format(DateTime.now())}',
        'type': 'missed',
        'duration': ''
      }
    ];

    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.friends,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FriendMutualInfor(null, 'Trần Đình Khôi', 500, 12),
            FriendDetailsInfor(friendDetails),
            if (isFriend) const FriendUnfriend(),
            if (isFriend)
              FriendCallsHistory(histories)
            else
              const FriendActions()
          ],
        ),
      ),
    );
  }
}
