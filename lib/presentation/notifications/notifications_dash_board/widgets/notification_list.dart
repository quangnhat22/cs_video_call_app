part of notifications_dash_board;

class NotificationList extends StatelessWidget {
  NotificationList({super.key});

  final names = ['Nguyễn Văn An', 'Trần Đình Khôi', 'Họp làm Figma'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                TextSpan(
                  text: names[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: AppLocalizations.of(context)!.want_to_friend_with_you)
              ])),
          leading: const CircleAvatar(child: Text('A')),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Wrap(
              spacing: 20,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30))),
                  child: Text(AppLocalizations.of(context)!.reject_request),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 30)),
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.accept_request),
                )
              ],
            ),
          ),
          tileColor: index % 2 == 0
              ? Theme.of(context).colorScheme.surfaceVariant
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        );
      },
      itemCount: names.length,
    );
  }
}
