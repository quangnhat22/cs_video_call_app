part of edit_profile;

class BioInput extends StatefulWidget {
  const BioInput({super.key});

  @override
  State<BioInput> createState() => _BioInputState();
}

class _BioInputState extends State<BioInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<EditProfileCubit>().bioChanged(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) =>
          previous.bio.value != current.bio.value && previous.bio.isPure,
      listener: (context, state) {
        _controller.text = state.bio.value;
      },
      builder: (context, state) {
        return CTextFormField(
          controller: _controller,
          icon: const Icon(Icons.help_outline),
          label: AppLocalizations.of(context)!.bio,
          type: InputType.multiline,
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
