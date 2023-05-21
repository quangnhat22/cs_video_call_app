part of find_new_friend;

class InputFindFriend extends StatefulWidget {
  const InputFindFriend({super.key});

  @override
  State<InputFindFriend> createState() => _InputFindFriendState();
}

class _InputFindFriendState extends State<InputFindFriend> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<FindFriendFormCubit>().emailChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: CTextFormField(
        controller: _controller,
        icon: const Icon(Icons.search),
        label: AppLocalizations.of(context)!.email_text_field_label,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
