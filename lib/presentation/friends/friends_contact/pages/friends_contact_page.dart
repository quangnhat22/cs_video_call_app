part of friends_contact;

class FriendsContactPage extends StatefulWidget {
  const FriendsContactPage({super.key});

  @override
  State<FriendsContactPage> createState() => _FriendsContactPageState();
}

class _FriendsContactPageState extends State<FriendsContactPage>
    with AutomaticKeepAliveClientMixin<FriendsContactPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) =>
      getIt<FriendsContactBloc>()
        ..add(const FriendsContactEvent.started()),
      child: const FriendsContactView(),
    );
  }
}

class FriendsContactView extends StatelessWidget {
  const FriendsContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: ListFriend(),
    );
  }
}
