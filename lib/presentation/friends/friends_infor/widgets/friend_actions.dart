part of friends_infor;

class FriendActions extends StatelessWidget {
  const FriendActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Card(
          elevation: 4,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.friend_add_friend,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                leading: Icon(
                  Icons.person_add,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () {},
              ),
              const Divider(
                height: 0,
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.friend_block,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                leading: Icon(
                  Icons.block,
                  color: Theme.of(context).colorScheme.error,
                ),
                onTap: () {},
              ),
            ],
          )),
    );
  }
}
