part of friends_infor;

class FriendMutualInfor extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final int mutualFriends;
  final int mutualGroups;

  FriendMutualInfor(
      this.avatarUrl, this.name, this.mutualFriends, this.mutualGroups,
      {super.key});

  final inforContainerHeight = 150.h;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: inforContainerHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 187, 205),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomAvatarImage(
                maxRadiusEmptyImg: 45,
                urlImage: avatarUrl,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: inforContainerHeight - 20.h,
          child: Card(
            elevation: 6,
            child: SizedBox(
              width: 0.9.sw,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          mutualFriends.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.friend_mutual_friends,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: VerticalDivider(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          mutualGroups.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.friend_mutual_groups,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
