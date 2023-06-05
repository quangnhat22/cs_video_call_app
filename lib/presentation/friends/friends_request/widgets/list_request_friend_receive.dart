part of friends_request;

class ListRequestFriendReceive extends StatelessWidget {
  const ListRequestFriendReceive({super.key, required this.listReceiveRequest});

  final List<FriendRequestEntity> listReceiveRequest;

  void _onRejectRequest(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;
    ctx.read<FriendRequestActionCubit>().rejectRequest(receiverId);
  }

  void _onAcceptRequest(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;
    ctx.read<FriendRequestActionCubit>().acceptRequest(receiverId);
  }

  @override
  Widget build(BuildContext context) {
    return (listReceiveRequest.isEmpty)
        ? Padding(
            padding: const EdgeInsets.all(32.0),
            child:
                Text(AppLocalizations.of(context)!.no_received_requests_found),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listReceiveRequest[index].receiver?.name ?? ""),
                leading: CustomAvatarImage(
                  urlImage: listReceiveRequest[index].receiver?.avatar,
                  maxRadiusEmptyImg: 20,
                  widthImage: 48,
                  heightImage: 48,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(listReceiveRequest[index].createdAt != null
                          ? AppDateTimeFormat.formatDDMMYYYY(
                              listReceiveRequest[index].createdAt)
                          : ""),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30)),
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
          );
  }
}
