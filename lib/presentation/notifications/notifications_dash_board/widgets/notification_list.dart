part of notifications_dash_board;

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return state.maybeWhen(
          getListInSuccess: (listNotification) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AppNotificationItem(noti: listNotification[index]);
              },
              itemCount: listNotification.length,
              separatorBuilder: (context, index) {
                return const DividerSpaceLeft();
              },
            );
          },
          getListFail: (_) {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
          orElse: () {
            return const Center(
              child: ListSkeleton(),
            );
          },
        );
      },
    );
  }
}
