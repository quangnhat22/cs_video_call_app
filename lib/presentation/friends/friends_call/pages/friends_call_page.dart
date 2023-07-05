part of friends_call;

class FriendsCallPage extends StatelessWidget {
  const FriendsCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<HistoryCallBloc>()..add(const HistoryCallEvent.started()),
      child: const FriendsCallView(),
    );
  }
}

class FriendsCallView extends StatelessWidget {
  const FriendsCallView({Key? key}) : super(key: key);

  void handleDropdownChange(AppCallStatus status) {
    debugPrint(status.value);
  }

  @override
  Widget build(BuildContext context) {
    return const ListFriendCall();
  }
}
