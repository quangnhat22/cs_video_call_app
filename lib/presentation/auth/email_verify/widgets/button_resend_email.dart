part of email_verify;

class ButtonResendEmail extends StatelessWidget {
  const ButtonResendEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendEmailCubit, SendEmailState>(
      builder: (context, state) {
        return state.maybeMap(verified: (_) {
          return Container();
        }, orElse: () {
          return CustomOutlinedButton(
            buttonText: AppLocalizations.of(context)!.i_dont_get_it,
            onPressed: () {
              context.read<SendEmailCubit>().sendEmail();
            },
            foregroundColor: Theme.of(context).colorScheme.primary,
            width: 0.8.sw,
          );
        });
      },
    );
  }
}
