part of find_new_friend;

class FindNewFriendPage extends StatelessWidget {
  const FindNewFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FindFriendFormCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<FindFriendBloc>(),
        ),
      ],
      child: const FindNewFriendView(),
    );
  }
}

class FindNewFriendView extends StatelessWidget {
  const FindNewFriendView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FindFriendBloc, FindFriendState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) =>
              SnackBarApp.showSnackBar(context, message, TypesSnackBar.error),
          success: (userResult) {
            NavigationUtil.pushNamed(
                routeName: RouteName.friendInfo, args: userResult);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: MPageAppBar(
            title: AppLocalizations.of(context)!.find_friend,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const InputFindFriend(),
                  ButtonFindFriend(
                    isInProgress: (state is FindFriendInProgress),
                  ),
                  if (state is FindFriendNotFound) const NotFoundResult(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
