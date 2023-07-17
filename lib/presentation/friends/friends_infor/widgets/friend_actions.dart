part of friends_infor;

class FriendActions extends StatelessWidget {
  const FriendActions({super.key, required this.friendInfo});

  final UserEntity friendInfo;

  void _handleAddFriend(BuildContext ctx) {
    ctx.read<FriendsActionCubit>().sentAddFriendRequest(friendInfo.id);
  }

  void _handleRemoveFriend(BuildContext ctx) {
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_delete_friend)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx.read<FriendsActionCubit>().deleteFriend(friendInfo.id);
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return (friendInfo.relation == AppFriendRelation.friend.value)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  CommonListTile(
                    isBorderTop: true,
                    title: Text(
                      AppLocalizations.of(context)!.friend_unfriend,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                    icon: Icon(
                      Icons.person_remove,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onTap: () => _handleRemoveFriend(context),
                  ),
                  //const ButtonFriendBlock(),
                ],
              ),
            ),
          )
        : (friendInfo.relation != AppFriendRelation.self.value)
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      CommonListTile(
                        isBorderTop: true,
                        title: Text(
                          AppLocalizations.of(context)!.friend_add_friend,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        icon: Icon(
                          Icons.person_add,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => _handleAddFriend(context),
                      ),
                      //const ButtonFriendBlock(),
                    ],
                  ),
                ),
              )
            : Container();
  }
}
