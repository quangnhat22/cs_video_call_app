part of profile;

class InputPhone extends StatefulWidget {
  const InputPhone({
    super.key,
  });

  @override
  State<InputPhone> createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<ProfileFormCubit>().phoneNumberChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileFormCubit, ProfileFormState>(
      //for init value
      listenWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber &&
          previous.phoneNumber.isPure,
      listener: (context, state) {
        _controller.text = state.phoneNumber.value;
      },
      builder: (context, state) {
        return CTextFormField(
          controller: _controller,
          icon: const Icon(Icons.phone),
          label: "${AppLocalizations.of(context)!.friend_phone} (*)",
          type: InputType.phoneNumber,
          errorText: state.phoneNumber.isNotValid
              ? state.phoneNumber.error?.message
              : null,
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
