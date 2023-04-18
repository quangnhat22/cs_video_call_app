part of friends_dash_board;

class ReceivedRequestList extends StatelessWidget {
  const ReceivedRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Nguyễn Văn An'),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('11.03.2070'),
                  ),
                  Wrap(
                    spacing: 20,
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30))),
                        child: Text(AppLocalizations.of(context)!
                            .reject_received_requests),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30)),
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context)!
                            .accept_received_requests),
                      )
                    ],
                  )
                ],
              ),
              leading: const CircleAvatar(child: Text('A')),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
