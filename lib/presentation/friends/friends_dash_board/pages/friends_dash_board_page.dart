part of friends_dash_board;

class FriendsDashBoardPage extends StatelessWidget {
  const FriendsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.friends,
      ),
      body: const Center(
        child: Text("Friends"),
      ),
    );
  }
}