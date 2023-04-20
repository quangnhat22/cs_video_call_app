part of friends_infor;

class FriendsInforPage extends StatelessWidget {
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

    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.friends,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FriendMutualInfor(null, 'Trần Đình Khôi', 500, 12),
            FriendDetailsInfor(friendDetails),
            const FriendActions()
          ],
        ),
      ),
    );
  }
}
