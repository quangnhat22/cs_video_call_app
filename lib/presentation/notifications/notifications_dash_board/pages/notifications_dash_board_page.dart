part of notifications_dash_board;

class NotificationsDashBoardPage extends StatelessWidget {
  const NotificationsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.notifications,
      ),
      body: const Center(
        child: Text("Notifications"),
      ),
    );
  }
}
