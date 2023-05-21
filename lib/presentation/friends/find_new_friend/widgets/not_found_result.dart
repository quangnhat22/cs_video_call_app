part of find_new_friend;

class NotFoundResult extends StatelessWidget {
  const NotFoundResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 64,
        ),
        const SizedBox(
          height: 32,
        ),
        AppAssets.notFoundSvg,
      ],
    );
  }
}
