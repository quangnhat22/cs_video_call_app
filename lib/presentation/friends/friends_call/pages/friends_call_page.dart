part of friends_call;

class FriendsCallPage extends StatefulWidget {
  const FriendsCallPage({Key? key}) : super(key: key);

  @override
  State<FriendsCallPage> createState() => _FriendsCallPageState();
}

class _FriendsCallPageState extends State<FriendsCallPage>
    with AutomaticKeepAliveClientMixin<FriendsCallPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) =>
          getIt<HistoryCallBloc>()..add(const HistoryCallEvent.started()),
      child: const FriendsCallView(),
    );
  }
}

class FriendsCallView extends StatelessWidget {
  const FriendsCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ListFriendCall(),
    );
  }
}
