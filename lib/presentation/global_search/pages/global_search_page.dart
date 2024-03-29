part of global_search;

@Injectable()
class GlobalSearch extends SearchDelegate<String> {
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
    if (query.isNotEmpty) {
      context
          .read<GlobalSearchBloc>()
          .add(GlobalSearchChanging(query: query.trim()));
    }

    return const SearchResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      context
          .read<GlobalSearchBloc>()
          .add(GlobalSearchChanging(query: query.trim()));
    }

    return const SearchResult();
  }
}
