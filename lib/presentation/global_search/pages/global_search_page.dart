part of global_search;

@Injectable()
class GlobalSearch extends SearchDelegate<String> {
  GlobalSearch({required SearchUseCase useCase}) : _useCase = useCase;

  final SearchUseCase _useCase;

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
    return getResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return getResults();
  }

  Widget getResults() {
    // final List<UserEntity> filteredFriends = [];

    // if (query.isNotEmpty) {
    //   final friends = _useCase.searchGlobally(query.toLowerCase());
    // }

    // return SearchResult(
    //   filteredFriends: filteredFriends,
    // );

    return FutureBuilder(
      future: _useCase.searchGlobally(query.toLowerCase()),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final friends;
          if (snapshot.hasData) {
            friends = snapshot.data;
          } else {
            friends = [];
          }

          return SearchResult(
            filteredFriends: friends,
          );
        }

        return const SearchResult(
          filteredFriends: [],
        );
      },
    );
  }
}
