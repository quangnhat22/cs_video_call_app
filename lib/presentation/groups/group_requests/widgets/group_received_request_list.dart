part of group_requests;

class GroupReceivedRequestList extends StatelessWidget {
  const GroupReceivedRequestList(
      {super.key, required this.receivedRequestList});

  final List<GroupRequestEntity> receivedRequestList;

  void _handleRejectReceivedRequest(BuildContext ctx, String? groupId) {
    if (groupId == null) return;
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_reject_group)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx.read<GroupRequestActionCubit>().rejectReceivedRequest(groupId);
          Navigator.of(ctx).pop();
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  void _handleAcceptReceivedRequest(BuildContext ctx, String groupId) {
    ctx.read<GroupRequestActionCubit>().acceptReceivedRequest(groupId);
  }

  @override
  Widget build(BuildContext context) {
    return receivedRequestList.isEmpty
        ? RefreshView(
            label: AppLocalizations.of(context)!.no_received_requests_found,
            onRefresh: () {
              context
                  .read<ListGroupRequestBloc>()
                  .add(const ListReceiveGroupRequestRefreshed());
            })
        : RefreshIndicator(
            onRefresh: () async {
              context
                  .read<ListGroupRequestBloc>()
                  .add(const ListReceiveGroupRequestRefreshed());
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                        onTap: () {
                          NavigationUtil.pushNamed(
                              routeName: RouteName.friendInfo);
                        },
                        child: Text(
                          receivedRequestList[index].group?.name ??
                              AppLocalizations.of(context)!.unknown_group,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      '${AppLocalizations.of(context)!.sent_by} '),
                              TextSpan(
                                  text: receivedRequestList[index].sender !=
                                              null &&
                                          receivedRequestList[index]
                                              .sender!
                                              .name!
                                              .isEmpty
                                      ? AppLocalizations.of(context)!
                                          .unknown_name
                                      : receivedRequestList[index]
                                          .sender!
                                          .name!,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                              TextSpan(
                                  text:
                                      ' ${AppLocalizations.of(context)!.at} ${DateFormat.yMMMMd().format(receivedRequestList[index].createdAt!)}'),
                            ],
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 20,
                        children: <Widget>[
                          OutlinedButton(
                            onPressed: () {
                              _handleRejectReceivedRequest(context,
                                  receivedRequestList[index].group!.id);
                            },
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 30))),
                            child: Text(
                                AppLocalizations.of(context)!.reject_request),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.onSecondary,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30)),
                            onPressed: () {
                              _handleAcceptReceivedRequest(context,
                                  receivedRequestList[index].group!.id);
                            },
                            child: Text(
                                AppLocalizations.of(context)!.accept_request),
                          )
                        ],
                      )
                    ],
                  ),
                  leading: CustomAvatarImage(
                    urlImage: receivedRequestList[index].sender?.avatar,
                    size: CustomAvatarSize.small,
                  ),
                );
              },
              itemCount: receivedRequestList.length,
            ),
          );
  }
}
