part of friends_contact;

class FriendsContactPage extends StatelessWidget {
  const FriendsContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<FriendsContactBloc>()..add(const FriendsContactEvent.started()),
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
