part of friends_infor;

class FriendUnfriend extends StatelessWidget {
  const FriendUnfriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(
            AppLocalizations.of(context)!.friend_unfriend,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          leading: Icon(
            Icons.person_remove,
            color: Theme.of(context).colorScheme.error,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          onTap: () {},
        ),
      ),
    );
  }
}
