part of friends_request;

class ListRequestFriendSend extends StatelessWidget {
  const ListRequestFriendSend({super.key, required this.listSentRequest});

  final List<FriendRequestEntity> listSentRequest;

  void _onTapRecallButton(BuildContext ctx, String? receiverId) {
    if (receiverId == null) return;
    ctx.read<FriendRequestActionCubit>().recallRequest(receiverId);
  }

  @override
  Widget build(BuildContext context) {
    return listSentRequest.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text("You didn't send any requests!"),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listSentRequest[index].receiver?.name ?? ""),
                subtitle: Text(
                  listSentRequest[index].createdAt != null
                      ? AppDateTimeFormat.formatDDMMYYYY(
                          listSentRequest[index].createdAt)
                      : "",
                ),
                leading: CustomAvatarImage(
                  urlImage: listSentRequest[index].receiver?.avatar,
                  maxRadiusEmptyImg: 20,
                  widthImage: 48,
                  heightImage: 48,
                ),
                trailing: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    onPressed: () => _onTapRecallButton(
                      context,
                      listSentRequest[index].receiver?.id,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.requests_recall_text_button,
                    ),
                  ),
                ),
              );
            },
            itemCount: listSentRequest.length,
          );
  }
}
