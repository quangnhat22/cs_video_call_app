part of global_search;

@Injectable()
class GlobalSearch extends SearchDelegate<String> {
  final Bloc<GlobalSearchEvent, GlobalSearchState> globalSearchBloc;

  GlobalSearch(this.globalSearchBloc);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<UserEntity> filteredFriends = [];

    if (query.isNotEmpty) {
      globalSearchBloc.add(GlobalSearchChanging(query: query.trim()));
    }

    return SearchResult(
      filteredFriends: filteredFriends,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<UserEntity> filteredFriends = [];

    if (query.isNotEmpty) {
      globalSearchBloc.add(GlobalSearchChanging(query: query.trim()));
    }

    return SearchResult(
      filteredFriends: filteredFriends,
    );
  }
}
