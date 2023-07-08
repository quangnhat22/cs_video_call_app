part of friends_infor;

class FriendsInfoPage extends StatelessWidget {
  const FriendsInfoPage({Key? key, required this.userInfo}) : super(key: key);

  final UserEntity userInfo;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FriendInfoCubit>()..pageInited(userInfo),
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
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              FriendMutualInfo(),
              FriendDetailsInfo(),
              FriendActions(),
              // FriendCallsHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
