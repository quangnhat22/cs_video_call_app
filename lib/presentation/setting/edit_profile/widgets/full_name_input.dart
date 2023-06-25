part of edit_profile;

class FullNameInput extends StatefulWidget {
  const FullNameInput({super.key});

  @override
  State<FullNameInput> createState() => _FullNameInputState();
}

class _FullNameInputState extends State<FullNameInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<EditProfileCubit>().fullNameChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
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
          // onChange: (value) {
          //   context.read<EditProfileCubit>().fullNameChanged(value);
          // },
        );
      },
    );
  }
}
