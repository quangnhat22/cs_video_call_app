part of friends_infor;

class FriendMutualInfo extends StatelessWidget {
  const FriendMutualInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendInfoCubit, FriendInfoState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
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
                    urlImage: state.user.avatar,
                    size: CustomAvatarSize.large,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      state.user.name ??
                          AppLocalizations.of(context)!.unknown_name,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
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
                              state.user.commonFriendCount != null
                                  ? state.user.commonFriendCount.toString()
                                  : "0",
                              style: const TextStyle(fontSize: 30),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .friend_mutual_friends,
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
                              state.user.commonGroupCount != null
                                  ? state.user.commonGroupCount.toString()
                                  : "0",
                              style: const TextStyle(fontSize: 30),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .friend_mutual_groups,
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
      },
    );
  }
}
