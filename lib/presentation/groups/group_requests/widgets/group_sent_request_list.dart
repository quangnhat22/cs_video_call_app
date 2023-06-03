part of group_requests;

class GroupSentRequestList extends StatelessWidget {
  const GroupSentRequestList({super.key, required this.sentRequestList});

  final List<GroupRequestEntity> sentRequestList;

  void _handleRecallSentRequest(
      BuildContext ctx, String groupId, String friendId) {
    ctx.read<GroupRequestActionCubit>().recallSentRequest(groupId, friendId);
  }

  @override
  Widget build(BuildContext context) {
    return sentRequestList.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(AppLocalizations.of(context)!.no_sent_requests_found),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  sentRequestList[index].group?.name ??
                      AppLocalizations.of(context)!.unknown_group,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: '${AppLocalizations.of(context)!.sent_to} '),
                      TextSpan(
                          text: sentRequestList[index].receiver != null &&
                                  sentRequestList[index].receiver!.name!.isEmpty
                              ? AppLocalizations.of(context)!.unknown_name
                              : sentRequestList[index].receiver!.name!,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      TextSpan(
                          text:
                              ' ${AppLocalizations.of(context)!.at} ${DateFormat.yMMMMd().format(sentRequestList[index].createdAt!)}'),
                    ])),
                leading: const CircleAvatar(child: Text('A')),
                trailing: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        padding: const EdgeInsets.symmetric(horizontal: 30)),
                    onPressed: () {
                      _handleRecallSentRequest(
                          context,
                          sentRequestList[index].group!.id,
                          sentRequestList[index].receiver!.id);
                    },
                    child: Text(AppLocalizations.of(context)!
                        .requests_recall_text_button),
                  ),
                ),
                isThreeLine: true,
              );
            },
            itemCount: sentRequestList.length,
          );
  }
}
