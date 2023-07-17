part of friends_infor;

class FriendMutualInfo extends StatelessWidget {
  const FriendMutualInfo({super.key, required this.friendInfo});

  final UserEntity friendInfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: 180.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 187, 205),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomAvatarImage(
                maxRadiusEmptyImg: 64,
                urlImage: friendInfo.avatar,
                size: CustomAvatarSize.large,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  friendInfo.name ?? AppLocalizations.of(context)!.unknown_name,
                  style: AppTextStyles.titleLarge,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 160.h,
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
                          friendInfo.commonFriendCount != null
                              ? friendInfo.commonFriendCount.toString()
                              : "0",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.friend_mutual_friends,
                          style: AppTextStyles.bodyMedium,
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
                          friendInfo.commonGroupCount != null
                              ? friendInfo.commonGroupCount.toString()
                              : "0",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.friend_mutual_groups,
                          style: AppTextStyles.bodyMedium,
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
