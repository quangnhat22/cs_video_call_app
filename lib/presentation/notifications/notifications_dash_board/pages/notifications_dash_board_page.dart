part of notifications_dash_board;

class NotificationsDashBoardPage extends StatelessWidget {
  const NotificationsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GlobalSearchBloc>(),
        ),
        BlocProvider(
          create: (_) =>
              getIt<NotificationBloc>()..add(const NotificationEvent.started()),
        ),
      ],
      child: const NotificationsDashboardView(),
    );
  }
}

class NotificationsDashboardView extends StatelessWidget {
  const NotificationsDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
