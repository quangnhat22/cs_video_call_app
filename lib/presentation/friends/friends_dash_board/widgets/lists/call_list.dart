part of friends_dash_board;

class CallList extends StatelessWidget {
  const CallList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const DividerSpaceLeft(),
      itemBuilder: (context, index) {
        return ListTile(
            title: const Text('Trần Đình Khôi'),
            subtitle: Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.arrow_outward,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const Text('(2) September 9 at 12:03 PM')
              ],
            ),
            leading: const CircleAvatar(
              child: Text('K'),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.call,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {},
            ));
      },
      itemCount: 12,
    );
  }
}
