part of email_verify;

class VerifyEmailLogoutButton extends StatelessWidget {
  const VerifyEmailLogoutButton({super.key});

  void _handleLogOut(BuildContext ctx) {
    AppDefaultDialogWidget()
        .setTitle(AppLocalizations.of(ctx)!.log_out)
        .setAppDialogType(AppDialogType.confirm)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setOnPositive(() {
          ctx.read<SendEmailCubit>().logOut();
        })
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      buttonText: AppLocalizations.of(context)!.log_out.toUpperCase(),
      foregroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () => _handleLogOut(context),
    );
  }
}
