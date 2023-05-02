part of groups_dash_board;

class GroupReceivedRequestList extends StatelessWidget {
  const GroupReceivedRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
                onTap: () {
                  NavigationUtil.pushNamed(routeName: RouteName.friendsInfor);
                },
                child: const Text(
                  'Team Siêu nhơn',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                      const TextSpan(text: 'Sent by '),
                      TextSpan(
                          text: 'Quang So Tech',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      const TextSpan(text: ' yesterday'),
                    ],
                  ),
                ),
              ),
              Wrap(
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
              )
            ],
          ),
          leading: const CircleAvatar(child: Text('A')),
        );
      },
      itemCount: 5,
    );
    ;
  }
}
