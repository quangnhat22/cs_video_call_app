part of friends_dash_board;

class ReceivedRequestList extends StatelessWidget {
  const ReceivedRequestList({super.key});

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
                child: const Text('Nguyễn Văn An')),
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
  }
}
