part of global_search;

class FriendSearchResult extends StatelessWidget {
  final List<UserEntity>? friends;

  const FriendSearchResult({super.key, this.friends});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            AppLocalizations.of(context)!.friends,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              debugPrint('123');
            },
            child: const ListTile(
              title: Text(
                '123',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('123'),
              leading: CustomAvatarImage(
                urlImage: 'https://i.pravatar.cc/',
                maxRadiusEmptyImg: 20,
                widthImage: 48,
                heightImage: 48,
              ),
            ),
          ),
          itemCount: randomNumber,
        ),
      ],
    );
  }
}
