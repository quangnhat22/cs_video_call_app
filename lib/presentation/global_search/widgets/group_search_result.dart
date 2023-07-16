part of global_search;

class GroupSearchResult extends StatelessWidget {
  final List<UserEntity>? friends;

  const GroupSearchResult({super.key, this.friends});

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
          getResultSuccess: (_, groups) {
            return groups == null
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
                          AppLocalizations.of(context)!.groups,
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
                          return GroupListItem(
                            groupId: groups[index].id,
                            groupName: groups[index].name ?? '',
                            groupAvatar: groups[index].imageUrl,
                          );
                        },
                        itemCount: groups.length,
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
