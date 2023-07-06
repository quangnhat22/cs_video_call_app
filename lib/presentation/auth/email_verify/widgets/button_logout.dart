part of email_verify;

class VerifyEmailLogoutButton extends StatelessWidget {
  const VerifyEmailLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      buttonText: AppLocalizations.of(context)!.log_out,
      foregroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () {
        context.read<SendEmailCubit>().logOut();
      },
    );
  }
}
