part of friends_infor;

class FriendsInfoPage extends StatelessWidget {
  const FriendsInfoPage({Key? key, required this.friendId}) : super(key: key);

  final String friendId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FriendInfoCubit>()..pageInited(friendId),
        ),
        BlocProvider(
          create: (_) => getIt<FriendsActionCubit>(),
        ),
      ],
      child: const FriendsInfoView(),
    );
  }
}

class FriendsInfoView extends StatelessWidget {
  const FriendsInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FriendsActionCubit, FriendsActionState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(sentAddRequestSuccess: () {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.action_success,
              TypesSnackBar.success);
          NavigationUtil.pushNamedAndRemoveUntil(route: RouteName.dashboard);
        }, sentAddRequestFailure: (message) {
          SnackBarApp.showSnackBar(context,
              AppLocalizations.of(context)!.action_fail, TypesSnackBar.error);
        });
      },
      child: Scaffold(
          appBar: MPageAppBar(
            title: AppLocalizations.of(context)!.friends,
          ),
          body: BlocBuilder<FriendInfoCubit, FriendInfoState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return state.maybeWhen(
                getInfoInSuccess: (friendInfo) {
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FriendMutualInfo(
                          friendInfo: friendInfo,
                        ),
                        FriendDetailsInfo(
                          friendInfo: friendInfo,
                        ),
                        FriendActions(
                          friendInfo: friendInfo,
                        ),
                        // FriendCallsHistory(),
                      ],
                    ),
                  );
                },
                getInfoFail: () {
                  return RefreshView(
                      label: AppLocalizations.of(context)!
                          .something_wrong_try_again,
                      onRefresh: () {
                        context.read<FriendInfoCubit>().pageRefreshed();
                      });
                },
                orElse: () {
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Skeleton.circle(
                          width: CustomAvatarSize.large.width,
                          height: CustomAvatarSize.large.height,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const ListSkeleton(),
                      ],
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
