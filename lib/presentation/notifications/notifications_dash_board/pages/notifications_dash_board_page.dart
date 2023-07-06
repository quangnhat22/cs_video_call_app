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
          title: '',
          actionButton: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.refresh_outlined),
                onPressed: () {
                  context
                      .read<NotificationBloc>()
                      .add(const NotificationEvent.refreshed());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  context
                      .read<NotificationBloc>()
                      .add(const ListNotificationDeleted());
                },
              ),
            ],
          )),
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<NotificationBloc>()
              .add(const NotificationEvent.refreshed());
        },
        child: const SingleChildScrollView(
          child: NotificationList(),
        ),
      ),
    );
  }
}
