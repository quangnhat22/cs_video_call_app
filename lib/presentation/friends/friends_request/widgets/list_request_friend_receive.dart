part of friends_request;

class ListRequestFriendReceive extends StatelessWidget {
  const ListRequestFriendReceive({super.key, required this.listReceiveRequest});

  final List<FriendRequestEntity> listReceiveRequest;

  void _onRejectRequest(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;

    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_reject_friend)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
          ctx.read<FriendRequestActionCubit>().rejectRequest(receiverId);
          Navigator.of(ctx).pop();
        })
        .buildDialog(ctx)
        .show(ctx);
  }

  void _onAcceptRequest(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;
    ctx.read<FriendRequestActionCubit>().acceptRequest(receiverId);
  }

  @override
  Widget build(BuildContext context) {
    return (listReceiveRequest.isEmpty)
        ? RefreshView(
            label: AppLocalizations.of(context)!.no_received_requests_found,
            onRefresh: () {
              context
                  .read<ListFriendRequestBloc>()
                  .add(const ListReceiveFriendRequestRefreshed());
            },
          )
        : RefreshIndicator(
            onRefresh: () async => {
              context
                  .read<ListFriendRequestBloc>()
                  .add(const ListReceiveFriendRequestRefreshed())
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      listReceiveRequest[index].receiver?.name ?? "",
                      style: AppTextStyles.bodyLarge,
                    ),
                    leading: CustomAvatarImage(
                      urlImage: listReceiveRequest[index].receiver?.avatar,
                      maxRadiusEmptyImg: 20,
                      size: CustomAvatarSize.small,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            listReceiveRequest[index].createdAt != null
                                ? AppDateTimeFormat.formatDDMMYYYY(
                                    listReceiveRequest[index].createdAt)
                                : "",
                            style: AppTextStyles.bodySmall,
                          ),
                        ),
                        Wrap(
                          spacing: 20,
                          children: <Widget>[
                            OutlinedButton(
                              onPressed: () => _onRejectRequest(
                                context,
                                listReceiveRequest[index].sender!.id,
                              ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30)),
                              onPressed: () => _onAcceptRequest(
                                context,
                                listReceiveRequest[index].sender!.id,
                              ),
                              child: Text(
                                  AppLocalizations.of(context)!.accept_request),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: listReceiveRequest.length,
              ),
            ),
          );
  }
}
