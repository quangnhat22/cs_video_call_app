part of friends_infor;

class FriendActions extends StatelessWidget {
  const FriendActions({super.key});

  void _handleAddFriend(BuildContext ctx) {
    final userId = ctx.read<FriendInfoCubit>().state.user.id;
    ctx.read<FriendsActionCubit>().sentAddFriendRequest(userId);
  }

  void _handleRemoveFriend(BuildContext ctx) {
    final userId = ctx.read<FriendInfoCubit>().state.user.id;
    ctx.read<FriendsActionCubit>().deleteFriend(userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendInfoCubit, FriendInfoState>(
      buildWhen: (prev, current) => prev.user != current.user,
      builder: (context, state) {
        if (state.user.relation == AppFriendRelation.friend.value) {
          return Padding(
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
          );
        } else {
          return Padding(
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
          );
        }
      },
    );
  }
}
