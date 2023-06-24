part of edit_profile;

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  void _handleEditProfile(BuildContext ctx) {
    ctx.read<EditProfileCubit>().updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 48),
          child: SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              buttonText: AppLocalizations.of(context)!.confirm,
              onPressed:
                  state.isValid ? () => _handleEditProfile(context) : null,
            ),
          ),
        );
      },
    );
  }
}
