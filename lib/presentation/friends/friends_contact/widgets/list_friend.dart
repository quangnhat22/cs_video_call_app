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
                      label: AppLocalizations.of(context)!.no_calls_found,
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
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
