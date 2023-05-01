part of friends_infor;

class FriendCallsHistory extends StatelessWidget {
  final List<Map<String, dynamic>> histories;

  const FriendCallsHistory(this.histories, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
            children: histories
                .mapIndexed((index, element) => ListTile(
                      title: Text(element['title']),
                      leading: element['type'] == 'incomming'
                          ? Icon(
                              Icons.call_received,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            )
                          : element['type'] == 'outgoing'
                              ? Icon(
                                  Icons.call_made,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                )
                              : Icon(
                                  Icons.phone_missed,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      trailing: Text(element['duration']),
                    ))
                .toList()),
      ),
    );
  }
}
