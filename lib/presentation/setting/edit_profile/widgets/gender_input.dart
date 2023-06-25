part of edit_profile;

class GenderInput extends StatefulWidget {
  const GenderInput({Key? key}) : super(key: key);

  @override
  State<GenderInput> createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: DropdownButtonFormField(
            items: [
              DropdownMenuItem(
                  value: AppGender.male,
                  child: Text(AppLocalizations.of(context)!.male)),
              DropdownMenuItem(
                  value: AppGender.female,
                  child: Text(AppLocalizations.of(context)!.female)),
              DropdownMenuItem(
                  value: AppGender.others,
                  child: Text(AppLocalizations.of(context)!.others)),
            ],
            value: state.gender,
            onChanged: (value) {
              context
                  .read<EditProfileCubit>()
                  .genderChanged(value as AppGender);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.face_outlined),
              label: Text('${AppLocalizations.of(context)!.gender} (*)'),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        );
      },
    );
  }
}
