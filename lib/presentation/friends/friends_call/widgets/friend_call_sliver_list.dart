part of friends_call;

class FriendCallSliverList extends StatelessWidget {
  const FriendCallSliverList({super.key, required this.calls});

  final List<CallEntity> calls;

  Widget _buildCallIcon(bool? isMyCall, String? status) {
    Color iconColor = Colors.red;
    IconData icon = Icons.call_received;

    if (isMyCall != null && isMyCall) {
      icon = Icons.call_made;
    }

    if (status?.toLowerCase() == AppCallStatus.onGoing.value.toLowerCase()) {
      iconColor = Colors.green;
    }

    return Icon(
      icon,
      color: iconColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isEven) {
            return ListTile(
              title: Text(calls[index ~/ 2].subjectCall?.name ?? ''),
              subtitle: Wrap(
                spacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  // _buildStatus(calls[index ~/ 2].status!),
                  _buildCallIcon(
                      calls[index ~/ 2].isMyCall, calls[index ~/ 2].status!),
                  Text(DateFormat("dd-MM-yyyy hh:mm aaa")
                      .format(calls[index ~/ 2].calledAt!.toLocal()))
                ],
              ),
              leading: SizedBox(
                width: 48,
                child: CustomAvatarImage(
                  urlImage: calls[index ~/ 2].subjectCall!.avatar,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.call,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  if (calls[index ~/ 2].status?.toLowerCase() ==
                      AppCallStatus.onGoing.value.toLowerCase()) {
                    NavigationUtil.pushNamed(
                      routeName: RouteName.personalCall,
                      args: {
                        "chatRoomId": calls[index ~/ 2].id,
                        "friendId": calls[index ~/ 2].subjectCall?.id,
                      },
                    );
                  } else {
                    NavigationUtil.pushNamed(
                      routeName: RouteName.personalCall,
                      args: {
                        "friendId": calls[index ~/ 2].subjectCall?.id,
                      },
                    );
                  }
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
