part of profile;

class InputGender extends StatelessWidget {
  const InputGender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFormCubit, ProfileFormState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return DropdownButtonFormField(
          items: const [
            DropdownMenuItem(value: AppGender.male, child: Text('Male')),
            DropdownMenuItem(value: AppGender.female, child: Text('Female')),
            DropdownMenuItem(value: AppGender.others, child: Text('Other')),
          ],
          value: state.gender ?? AppGender.others,
          onChanged: (value) {
            context.read<ProfileFormCubit>().genderChanged(value as AppGender);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.face_outlined),
            label: Text('Gender (*)'),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        );
      },
    );
  }
}
