part of profile;

class InputFullname extends StatefulWidget {
  const InputFullname({
    super.key,
  });

  @override
  State<InputFullname> createState() => _InputFullnameState();
}

class _InputFullnameState extends State<InputFullname> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<ProfileFormCubit>().fullnameChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileFormCubit, ProfileFormState>(
      //for init value
      listenWhen: (previous, current) =>
          previous.fullName != current.fullName && previous.fullName.isPure,
      listener: (context, state) {
        _controller.text = state.fullName.value;
      },
      builder: (context, state) {
        return CTextFormField(
          controller: _controller,
          icon: const Icon(Icons.badge),
          label: "${AppLocalizations.of(context)!.full_name} (*)",
          errorText:
              state.fullName.isNotValid ? state.fullName.error?.message : null,
          onChange: (value) {},
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
