part of global_search;

class FriendSearchResult extends StatelessWidget {
  const FriendSearchResult({super.key});

  Widget buildLoadingSpinner() {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSearchBloc, GlobalSearchState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          getResultSuccess: (friends, _) {
            return friends == null
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          AppLocalizations.of(context)!.friends,
                          style: AppTextStyles.titleLarge
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListFriendItem(
                            id: friends[index].id,
                            name: friends[index].name,
                            avatar: friends[index].avatar,
                            email: friends[index].email,
                          );
                        },
                        itemCount: friends.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const DividerSpaceLeft();
                        },
                      ),
                    ],
                  );
          },
          getResultInProgress: () {
            return buildLoadingSpinner();
          },
          getResultFailed: (message) {
            return Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Text(AppLocalizations.of(context)!.error_message),
              ),
            );
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }
}
