part of global_search;

class SearchResult extends StatelessWidget {
  final List<UserEntity>? filteredFriends;

  const SearchResult({super.key, this.filteredFriends});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FriendSearchResult(
            friends: filteredFriends,
          )
        ],
      ),
    );
  }
}
