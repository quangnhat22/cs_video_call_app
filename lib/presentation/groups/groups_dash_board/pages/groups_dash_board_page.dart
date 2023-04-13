part of groups_dash_board;

class GroupsDashBoardPage extends StatelessWidget {
  const GroupsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.groups,
      ),
      body: const Center(
        child: Text("Groups"),
      ),
    );
  }
}
