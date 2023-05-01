part of friends_infor;

class FriendActions extends StatelessWidget {
  const FriendActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
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
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                onTap: () {},
              ),
            ],
          )),
    );
  }
}
