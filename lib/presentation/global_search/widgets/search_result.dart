part of global_search;

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSearchBloc, GlobalSearchState>(
      builder: (context, state) {
        return state.maybeWhen(
          getResultSuccess: (friends, groups) {
            if (friends == null ||
                groups == null ||
                friends.isEmpty && groups.isEmpty) {
              return Center(child: AppAssets.notFoundSvg);
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  FriendSearchResult(),
                  GroupSearchResult(),
                ],
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
