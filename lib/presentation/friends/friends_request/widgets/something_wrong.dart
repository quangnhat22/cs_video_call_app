part of friends_request;

class SomeThingWrong extends StatelessWidget {
  const SomeThingWrong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Something wrong! Try again"),
        const SizedBox(
          height: 16,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.refresh_outlined),
        ),
      ],
    );
  }
}
