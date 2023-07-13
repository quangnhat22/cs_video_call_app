part of global_search;

class FriendSearchResult extends StatelessWidget {
  final List<UserEntity>? friends;

  const FriendSearchResult({super.key, this.friends});

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
          getResultSuccess: (friends) {
            return friends == null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        AppLocalizations.of(context)!.no_result_found,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  )
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
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              friends[index].name!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: CustomAvatarImage(
                              urlImage: friends[index].avatar,
                              maxRadiusEmptyImg: 20,
                              size: CustomAvatarSize.small,
                            ),
                          ),
                        ),
                        itemCount: friends.length,
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
            return buildLoadingSpinner();
          },
        );
      },
    );
  }
}
