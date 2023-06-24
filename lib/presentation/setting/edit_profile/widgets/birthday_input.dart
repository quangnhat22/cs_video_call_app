part of edit_profile;

class BirthdayInput extends StatefulWidget {
  const BirthdayInput({Key? key}) : super(key: key);

  @override
  State<BirthdayInput> createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  final TextEditingController _dateInputController = TextEditingController();

  void _onTapBirthdayInput(BuildContext ctx) async {
    DateTime? pickedDate = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now());

    if (pickedDate != null && ctx.mounted) {
      ctx.read<EditProfileCubit>().birthdayChanged(pickedDate);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) => previous.dob != current.dob,
      listener: (context, state) {
        if (state.dob != null) {
          _dateInputController.text =
              AppDateTimeFormat.formatDDMMYYYY(state.dob);
        }
      },
      child: CTextFormField(
        controller: _dateInputController,
        icon: const Icon(Icons.calendar_today),
        label: AppLocalizations.of(context)!.friend_birthday,
        isReadOnly: true,
        onTap: () => _onTapBirthdayInput(context),
      ),
    );
  }

  @override
  void dispose() {
    _dateInputController.dispose();
    super.dispose();
  }
}
