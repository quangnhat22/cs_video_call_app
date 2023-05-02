part of friends_dash_board;

class SentRequestList extends StatelessWidget {
  const SentRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: const Text('Nguyễn Văn An'),
          subtitle: const Text('11.03.2070'),
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
        );
      },
      itemCount: 3,
    );
  }
}
