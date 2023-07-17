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

  void _deleteAllNotification(BuildContext ctx) {
    AppDefaultDialogWidget()
        .setTitle(AppLocalizations.of(ctx)!.delete_all_noti_title)
        .setContent(AppLocalizations.of(ctx)!.delete_all_noti_content)
        .setAppDialogType(AppDialogType.confirm)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setOnPositive(() {
          ctx.read<NotificationBloc>().add(const ListNotificationDeleted());
          Navigator.of(ctx).pop();
        })
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .buildDialog(ctx)
        .show(ctx);
  }

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
                onPressed: () => _deleteAllNotification(context),
              ),
            ],
          )),
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<NotificationBloc>()
              .add(const NotificationEvent.refreshed());
        },
        child: const NotificationList(),
      ),
    );
  }
}
