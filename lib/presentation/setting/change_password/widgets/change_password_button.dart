part of change_password;

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  void handleSubmit(BuildContext context) {
    context.read<ChangePasswordCubit>().changePasswordFormSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircularProgressIndicator(),
          );
        }

        return CustomElevatedButton(
          buttonText: AppLocalizations.of(context)!.confirm,
          onPressed: state.isValid
              ? () {
                  handleSubmit(context);
                }
              : null,
          backgroundColor: Theme.of(context).colorScheme.primary,
        );
      },
    );
  }
}
