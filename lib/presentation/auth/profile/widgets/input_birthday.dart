part of profile;

class InputBirthday extends StatefulWidget {
  const InputBirthday({
    super.key,
  });

  @override
  State<InputBirthday> createState() => _InputBirthdayState();
}

class _InputBirthdayState extends State<InputBirthday> {
  final TextEditingController _controller = TextEditingController();

  void _onTapBirthdayInput(BuildContext ctx) async {
    DateTime? pickedDate = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now());

    if (pickedDate != null && ctx.mounted) {
      ctx.read<ProfileFormCubit>().birthdayChanged(pickedDate);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileFormCubit, ProfileFormState>(
      listenWhen: (previous, current) => previous.dob != current.dob,
      listener: (context, state) {
        if (state.dob != null) {
          _controller.text = AppDateTimeFormat.formatDDMMYYYY(state.dob);
        }
      },
      child: CTextFormField(
        controller: _controller,
        icon: const Icon(Icons.calendar_today),
        label: AppLocalizations.of(context)!.friend_birthday,
        isReadOnly: true,
        onTap: () => _onTapBirthdayInput(context),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
