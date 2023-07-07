part of friends_contact;

class ListFriend extends StatelessWidget {
  const ListFriend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsContactBloc, FriendsContactState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          success: (friends) {
            return friends.isEmpty
                ? Center(
                    child: RefreshView(
                      label: AppLocalizations.of(context)!.no_friends_found,
                      onRefresh: () {
                        context
                            .read<FriendsContactBloc>()
                            .add(const FriendsContactRefreshed());
                      },
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<FriendsContactBloc>()
                          .add(const FriendsContactRefreshed());
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const DividerSpaceLeft(),
                      itemBuilder: (context, index) {
                        return ListFriendItem(
                          id: friends[index].id,
                          name: friends[index].name,
                          avatar: friends[index].avatar,
                          email: friends[index].email,
                        );
                      },
                      itemCount: friends.length,
                    ),
                  );
          },
          failure: (message) {
            return RefreshView(
              label: AppLocalizations.of(context)!.something_wrong_try_again,
              onRefresh: () {
                context
                    .read<FriendsContactBloc>()
                    .add(const FriendsContactRefreshed());
              },
            );
          },
          orElse: () {
            return const ListSkeleton();
          },
        );
      },
    );
  }
}
