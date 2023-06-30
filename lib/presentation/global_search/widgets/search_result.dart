part of global_search;

class SearchResult extends StatelessWidget {
  final List<UserEntity>? filteredFriends;
  final String? query;

  const SearchResult({super.key, this.filteredFriends, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GlobalSearchBloc>()
        ..add(GlobalSearchEvent.searchInputChanging(query: query!)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FriendSearchResult(
              friends: filteredFriends,
            )
          ],
        ),
      ),
    );
  }
}
