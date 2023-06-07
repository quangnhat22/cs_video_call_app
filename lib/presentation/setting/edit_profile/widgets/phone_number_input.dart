part of edit_profile;

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({
    super.key,
  });

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<EditProfileCubit>().phoneNumberChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
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
