part of friends_call;

// calls[index ~/ 2].callee!.avatar

class FriendCallSliverList extends StatelessWidget {
  const FriendCallSliverList({super.key, required this.calls});

  final List<CallEntity> calls;

  Widget _buildStatus(String status) {
    Color textColor = Colors.red;

    if (status.toLowerCase() == AppCallStatus.onGoing.value.toLowerCase()) {
      textColor = Colors.green;
    }

    return Text(
      status,
      style: TextStyle(color: textColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isEven) {
            return ListTile(
              title: Text(calls[index ~/ 2].callee?.name ?? ''),
              subtitle: Wrap(
                spacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  _buildStatus(calls[index ~/ 2].status!),
                  Text(DateFormat("dd-MM-yyyy hh:mm aaa")
                      .format(calls[index ~/ 2].calledAt!))
                ],
              ),
              leading: SizedBox(
                width: 48,
                child: CustomAvatarImage(
                  urlImage: calls[index ~/ 2].callee!.avatar,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.call,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  NavigationUtil.pushNamed(
                    routeName: RouteName.personalCall,
                    args: {
                      "friend-id": calls[index ~/ 2].callee?.id,
                    },
                  );
                },
              ),
            );
          }
          return const DividerSpaceLeft();
        },
        semanticIndexCallback: (Widget widget, int localIndex) {
          if (localIndex.isEven) {
            return localIndex ~/ 2;
          }
          return null;
        },
        childCount: math.max(0, calls.length * 2 - 1),
      ),
    );
  }
}
