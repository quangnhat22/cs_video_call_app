part of friends_call;

class ListFriendCall extends StatelessWidget {
  const ListFriendCall({Key? key}) : super(key: key);

  void _onCallFriendBtn() {
    NavigationUtil.pushNamed(routeName: RouteName.callPending);
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final int itemIndex = index ~/ 2;
          if (index.isEven) {
            return ListTile(
                title: const Text('Trần Đình Khôi'),
                subtitle: Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_outward,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    const Text('(2) September 9 at 12:03 PM')
                  ],
                ),
                leading: const CircleAvatar(
                  child: Text('K'),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: _onCallFriendBtn,
                ));
          }
          return const DividerSpaceLeft();
        },
        semanticIndexCallback: (Widget widget, int localIndex) {
          if (localIndex.isEven) {
            return localIndex ~/ 2;
          }
          return null;
        },
        childCount: math.max(0, 2 * 2 - 1),
      ),
    );
  }
}
