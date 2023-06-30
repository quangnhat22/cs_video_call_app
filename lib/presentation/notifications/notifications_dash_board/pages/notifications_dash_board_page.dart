part of notifications_dash_board;

class NotificationsDashBoardPage extends StatelessWidget {
  const NotificationsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GlobalSearchBloc>(),
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.notifications,
          actionButton: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: NotificationList(),
        ),
      ),
    );
  }
}
