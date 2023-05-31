part of group_requests;

class GroupSentRequestList extends StatelessWidget {
  const GroupSentRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: const Text(
            'Team Siêu Nhơn',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  children: <TextSpan>[
                const TextSpan(text: 'Sent by '),
                TextSpan(
                    text: 'Quang So Tech',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                const TextSpan(text: ' yesterday'),
              ])),
          leading: const CircleAvatar(child: Text('A')),
          trailing: SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 30)),
              onPressed: () {},
              child: Text(
                  AppLocalizations.of(context)!.requests_recall_text_button),
            ),
          ),
          isThreeLine: true,
        );
      },
      itemCount: 3,
    );
  }
}
