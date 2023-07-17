part of notifications_dash_board;

class AppNotificationItem extends StatelessWidget {
  const AppNotificationItem({
    super.key,
    required this.noti,
  });

  final NotificationEntity noti;

  String? _returnOwnerNotification() {
    switch (noti.action) {
      case 'receive-friend-request':
      case 'receive-group-request':
        return noti.prep?.name;
      case 'incoming-call':
      case 'accept-request':
      case 'reject-call':
      case 'abandon-call':
        return noti.subject?.name;
      default:
        return '';
    }
  }

  String? _returnImageNotification() {
    switch (noti.action) {
      case 'receive-friend-request':
      case 'receive-group-request':
        return noti.prep?.image;
      case 'incoming-call':
      case 'accept-request':
      case 'reject-call':
      case 'abandon-call':
        return noti.subject?.image;
      default:
        return '';
    }
  }

  String? _returnActionNotification(BuildContext context) {
    switch (noti.action) {
      case 'receive-friend-request':
        return AppLocalizations.of(context)!.want_to_friend_with_you;
      case 'receive-group-request':
        return AppLocalizations.of(context)!.invited_you_to_join_group;
      case 'incoming-call':
        return AppLocalizations.of(context)!.is_calling;
      case 'accept-request':
        return AppLocalizations.of(context)!.accepted_requets;
      case 'reject-call':
        return AppLocalizations.of(context)!.reject_call_message;
      case 'abandon-call':
        return AppLocalizations.of(context)!
            .abandon_call_message(noti.direct?.name.toString() ?? '');
      default:
        return '';
    }
  }

  void _handleOnTapAccept(BuildContext ctx, String type) {
    String id = '';
    if (noti.action == 'receive-friend-request') {
      id = noti.prep!.id;
    }
    if (noti.action == 'receive-group-request') {
      id = noti.indirect!.id;
    }
    if (noti.action == 'incoming-call') {
      ctx.read<NotificationBloc>().add(NotifcationTapped(
          type: type,
          actionType: type,
          isAccept: true,
          id: noti.prep!.id,
          friendId: noti.subject!.id));
      return;
    }
    if (id.isNotEmpty) {
      ctx.read<NotificationBloc>().add(NotifcationTapped(
          type: type, actionType: type, isAccept: true, id: id));
    }
  }

  void _handleOnTapReject(BuildContext ctx, String type) {
    String content = '';
    String id = '';
    if (noti.action == 'receive-friend-request') {
      content = AppLocalizations.of(ctx)!.do_you_want_reject_friend;
      id = noti.prep?.id ?? '';
    }
    if (noti.action == 'receive-group-request') {
      content = AppLocalizations.of(ctx)!.do_you_want_reject_group;
      id = noti.indirect?.id ?? '';
    }
    if (noti.action == 'incoming-call') {
      content = AppLocalizations.of(ctx)!.do_you_want_reject_call;
      id = noti.prep?.id ?? '';
    }
    if (content.isNotEmpty && id.isNotEmpty) {
      AppDefaultDialogWidget()
          .setAppDialogType(AppDialogType.confirm)
          .setTitle(AppLocalizations.of(ctx)!.confirm)
          .setContent(content)
          .setNegativeText(AppLocalizations.of(ctx)!.cancel)
          .setPositiveText(AppLocalizations.of(ctx)!.confirm)
          .setOnPositive(() {
            ctx.read<NotificationBloc>().add(NotifcationTapped(
                type: type, actionType: type, isAccept: false, id: id));
            Navigator.of(ctx).pop();
          })
          .buildDialog(ctx)
          .show(ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext ctx) {
              ctx
                  .read<NotificationBloc>()
                  .add(NotificationDeletedById(id: noti.id));
            },
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete_noti,
          ),
        ],
      ),
      child: ListTile(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onBackground),
            children: <TextSpan>[
              TextSpan(
                text: _returnOwnerNotification(),
                style: AppTextStyles.titleSmall
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: _returnActionNotification(context),
                style: AppTextStyles.titleSmall,
              ),
            ],
          ),
        ),
        leading: CustomAvatarImage(
          urlImage: _returnImageNotification(),
          size: CustomAvatarSize.small,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              AppDateTimeFormat.convertToHourMinuteFollowDay(
                noti.createdAt ?? DateTime.now(),
              ),
              style: AppTextStyles.bodySmall,
            ),
            if (noti.action != null &&
                noti.action != 'accept-request' &&
                noti.action != 'abandon-call' &&
                noti.action != 'reject-call')
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(
                  spacing: 20,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () =>
                          _handleOnTapReject(context, noti.action!),
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 30))),
                      child: Text(AppLocalizations.of(context)!.reject_request),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          padding: const EdgeInsets.symmetric(horizontal: 30)),
                      onPressed: () =>
                          _handleOnTapAccept(context, noti.action!),
                      child: Text(AppLocalizations.of(context)!.accept_request),
                    )
                  ],
                ),
              ),
          ],
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
    );
  }
}
